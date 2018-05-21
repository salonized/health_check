require "test_helper"

class HealthCheck::MiddlewareTest < Minitest::Test
  def setup
    @endpoint = '/health'
    @body = 'YEA'
    @status = 201
  end


  def middleware(options = {})
    @middleware ||= HealthCheck::Middleware.new(Class.new, options)
  end

  def test_default_values
    assert_equal '/ping', middleware.config.endpoint
    assert_equal 200, middleware.config.response_status
    assert_equal 'OK', middleware.config.response_body
  end

  def test_custom_options
    middleware(endpoint: @endpoint, response_status: @status, response_body: @body)

    assert_equal @endpoint, middleware.config.endpoint
    assert_equal @status, middleware.config.response_status
    assert_equal @body, middleware.config.response_body
  end
end
