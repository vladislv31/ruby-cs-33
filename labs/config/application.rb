# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'active_record/railtie'
require 'kaminari'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lab1
  # The main entry point for the Lab1 application.
  # This class is responsible for booting up the Rails framework and initializing
  # any required components. It also provides a number of configuration options
  # that can be used to customize the behavior of the application.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.autoload_paths += %W[#{config.root}/app/models]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
