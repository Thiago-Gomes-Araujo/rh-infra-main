require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RhInfra
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.time_zone = "La Paz" # Configuração do Time Zone
    config.i18n.default_locale = :'pt-BR' # Configuração do idioma padrão

    config.generators do |g|
      g.test_framework nil #to skip test framework
      g.assets false
      g.helper false
      g.stylesheets false
    end
  end
end
