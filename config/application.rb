require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kseniasmirnova
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  nil
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.skip_routes     true
    end

    config.to_prepare do
      Clearance::PasswordsController.layout "admin"
      Clearance::SessionsController.layout "admin"
      Clearance::UsersController.layout "admin"
    end

    config.autoload_paths += [Rails.root.join('app', 'validators').to_s]
  end
end
