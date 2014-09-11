require "test_helper"
require 'minitest/spec'
require 'minitest/autorun'
require 'capybara/rails'

class LoginTest < Minitest::Spec
  visit Rails.application.routes.url_helpers.new_user_path

end