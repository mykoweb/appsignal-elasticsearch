require 'rubygems'
require 'active_support/notifications'
require 'appsignal-elasticsearch'

require 'pry'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

RSpec.configure do |config|
  config.mock_with :rspec
end
