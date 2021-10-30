class LoginPage
  include Capybara::DSL

  def initialize
    @login_page = 'https://smartslides.com/login'
  end

  def visit_to_login_page
    visit @login_page
    puts "Login page"

    page.has_text?('Log in with your Pixellu Account')
  end

  def log_in(login:, password:)
    puts "login with #{login} and password #{password}"
    set_value('email', login)
    set_value('password', password)

    click_button('Log In') if page.has_xpath?('//span[contains(., "Log In")]')

    WaitUtil.wait_for_condition(
      'Button Processing... is invisible',
      timeout_sec: 10,
      delay_sec: 1
    ) { page.has_no_xpath?('//span[contains(., "Processing")]') }
  end

  def set_value(path_name, value)
    puts "set #{value}"
    find(:xpath, "//input[contains(@type, '#{path_name}')]").set(value)
  end

  def user_successfully_log_in?
    page.has_no_text?('Incorrect email or password', wait: 0)
  end
end
