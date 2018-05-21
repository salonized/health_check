module HealthCheck
  class Configuration
    attr_accessor :http_endpoint

    def initialize
      self.endpoint = '/ping'
    end
  end
end
