# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Logger.new(STDOUT)
Rails.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"