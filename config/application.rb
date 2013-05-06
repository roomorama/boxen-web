require File.expand_path("../boot", __FILE__)
require 'dotenv'
Dotenv.load

require "action_controller/railtie"
require "active_record/railtie"
require "erubis"
require "jquery/rails"
require "net/http"
require "sprockets/railtie"
require "uri"

module Boxen
  class Application < Rails::Application

    # don"t allow unescaped HTML in JSON
    config.active_support.escape_html_entities_in_json = true

    # require attr_accessible or attr_protected
    config.active_record.whitelist_attributes = true

    # let"s use the asset pipeline
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false

    # asset version, bump to expire everything
    config.assets.version = "1.0"

    # utf-8 errwhere in templates
    config.encoding = "utf-8"

    # don't log these params
    config.filter_parameters += [:password]
  end
end
