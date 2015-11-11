require 'elasticsearch'
require 'active_support'

module Appsignal
  module Elasticsearch
    module Instrumentation

      def perform_request_with_appsignal_instrumentation(method, path, params, body, &block)
        args = { method: method, path: path, params: params, body: body }
        ActiveSupport::Notifications.instrument(
          'query.elasticsearch', :query => args) do
            perform_request_without_appsignal_instrumentation(method, path, params, body, &block)
          end
      end

    end
  end
end

::Elasticsearch::Transport::Client.class_eval do
  include Appsignal::Elasticsearch::Instrumentation

  alias_method :perform_request_without_appsignal_instrumentation, :perform_request
  alias_method :perform_request, :perform_request_with_appsignal_instrumentation
end
