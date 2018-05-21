require "test_helper"

class HealthCheck::MiddlewareTest < Minitest::Test
  def setup
    @endpoint = '/health'
    @status_code = 201
  end


  def middleware(options = {})
    @middleware ||= HealthCheck::Middleware.new(Class.new, options)
  end

  def test_default_values
    assert_equal '/ping', middleware.config.endpoint
    assert_equal 200, middleware.config.status_code
  end

  def test_custom_options
    middleware(endpoint: @endpoint, status_code: @status_code)

    assert_equal @endpoint, middleware.config.endpoint
    assert_equal @status_code, middleware.config.status_code
  end
end
