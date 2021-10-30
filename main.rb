require './spec_helper'

describe 'Test for' do
  LOGIN = 'ta_interview@pixellu.com'.freeze
  CORRECT_PASSWORD = YAML.safe_load(File.open('params.yml', 'r'))['login'].freeze
  INCORRECT_PASSWORD = YAML.safe_load(File.open('params.yml', 'r'))['password'].freeze

  let(:login_page) { LoginPage.new }
  let(:user_page) { UserPage.new }
  before(:each) do
    Capybara.reset_sessions!
    login_page.visit_to_login_page
  end

  scenario 'Login is successful' do
    login_page.log_in(
      login: LOGIN,
      password: CORRECT_PASSWORD
    )

    expect(login_page.user_successfully_log_in?).to be true
    expect(user_page.page_fully_loaded?).to be true
  end

  scenario 'Login is unsuccessful' do
    login_page.log_in(
      login: LOGIN,
      password: INCORRECT_PASSWORD
    )

    expect(login_page.user_successfully_log_in?).to be false
  end
end
