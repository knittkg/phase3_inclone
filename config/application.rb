require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inclone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # glyphiconsが使っている*.eot *.svg *.ttf *.woffらを precompile の対象に含める
    config.assets.precompile += %w(*.eot *.svg *.ttf *.woff)

    # glyphiconsのパスを通す 2018/02/12 10:25
    # https://stackoverflow.com/questions/48047545/rails-5-1-2-bootstrap-icons-not-being-served-in-production
    config.assets.paths << "#{Rails.root.to_s}/app/assets/fonts"
  end
end
