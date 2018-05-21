require "test_helper"

class HealthCheckTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HealthCheck::VERSION
  end
end
