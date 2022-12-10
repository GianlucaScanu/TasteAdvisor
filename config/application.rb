require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TasteAdvisor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.action_view.preload_links_header = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    #imgs
    config.public_file_server.enabled = true
    config.serve_static_assets = true

    # mailer per reset password
    # credits: https://axiumone.medium.com/forgotten-password-recover-email-with-devise-and-rails-3d32249c6cdb
    config.action_mailer.delivery_method = :sendmail
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_options = {from: 'lassi.pepascamu@gmail.com'}
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 587,
      domain:               'gmail.com',
      user_name:            Rails.application.credentials.gmail('lassi.pepascamu@gmail.com'),
      password:             Rails.application.credentials.gmail('renzopastori00'),
      authentication:       'plain',
      enable_starttls_auto: true  }
    config.action_mailer.default_url_options = {:host =>'localhost:3000'}

    Google::Maps.configure do |config|
      config.authentication_mode = Google::Maps::Configuration::API_KEY
      config.api_key = 'AIzaSyCXBINbcHzq6sqrq3ku3ABFKFahO7ZpgiI'
      config.default_language = :it
    end
    
  end
end
