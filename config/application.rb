require_relative 'boot'

require 'rails/all'
require 'pp'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.emailserver = config_for(:my_config)

	config.eager_load_paths += %W(#{Rails.root.join}/lib #{Rails.root.join('app', '*')})

    config.active_record.raise_in_transactional_callbacks = true

    # Bower asset paths
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end
	
    # Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

	config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )
  end
end
