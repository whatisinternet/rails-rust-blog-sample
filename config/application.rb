require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RustBlog
  class Application < Rails::Application
    require "#{Rails.root}/lib/rust_linker"
    config.autoload_paths << Rails.root.join('lib')
  end
end
