require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'pry'
require 'selenium/webdriver'
require 'yaml'
require 'waitutil'
require_relative 'pages/login_page'
require_relative 'pages/user_page'
require_relative 'params.yml'

Capybara.default_max_wait_time = 5
Capybara.javascript_driver = :selenium_chrome
RSpec.configure { Capybara.current_driver = :selenium_chrome }
