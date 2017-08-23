# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'console_logger'
module AppPerf
  class Application < Rails::Application
    config.logger = ConsoleLogger.new
  end
end

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger.level = ENV['LOGGING_LEVEL'] || :debug
