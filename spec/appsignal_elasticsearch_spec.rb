require 'spec_helper'

describe Appsignal::Elasticsearch do
  let(:client)  { Elasticsearch::Client.new }
  let(:event)   { @events.pop }
  let(:payload) { event.payload }

  before(:all) do
    @events = []
    ActiveSupport::Notifications.subscribe('query.elasticsearch') do |*args|
      @events << ActiveSupport::Notifications::Event.new(*args)
    end
  end

  context 'client.exists?' do
    let(:index) { 'foobar4321' }
    let(:type)  { 'sometype' }
    let(:id)    { '1234' }

    before { client.exists? index: index, type: type, id: id }

    context 'payload' do
      it 'has the correct method' do
        expect(payload[:query][:method]).to eq 'HEAD'
      end

      it 'has the correct path' do
        expect(payload[:query][:path]).to eq "#{index}/#{type}/#{id}"
      end

      it 'has the correct exception' do
        expect(payload[:exception][0]).to eq 'Elasticsearch::Transport::Transport::Errors::NotFound'
        expect(payload[:exception][1]).to eq '[404] '
      end
    end
  end
end
