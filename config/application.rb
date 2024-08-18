require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PongApi
  class Application < Rails::Application
    # Provides an HTML generator for displaying errors that come from Active Model
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      raw Nokogiri::HTML.fragment(html_tag).child.add_class("is-invalid")
    end
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Flash
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Session::CookieStore, { key: "_pong_api_session" }
    config.default_url_options = { host: "localhost", port: 3000 }
  end
end
