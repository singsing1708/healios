require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Healios
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_mailer.smtp_settings = {
      address: ENV.fetch("MAIL_ADDRESS"),
      port: ENV.fetch("MAIL_PORT"),
      user_name: ENV.fetch("MAIL_USERNAME"),
      password: ENV.fetch("MAIL_PASSWORD"),
      authentication: :plain,
      enable_starttls_auto: true
    }
  end
end
