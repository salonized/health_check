module HealthCheck
  class Middleware
    # class Configuration
    #   attr_accessor :endpoint, :status_code
    #
    #   def initialize(options = {})
    #     self.endpoint = '/ping'
    #     self.status_code = 200
    #
    #     Hash[options].each do |key,value|
    #       instance_variable_set(key, value)
    #     end
    #   end
    # end

    class << self
      def default_options
        {
          endpoint: '/ping',
          status_code: 200
        }
      end
    end

    attr_reader :app, :config

    def initialize(app, options = {})
      @app = app
      @config = OpenStruct.new(self.class.default_options.merge(Hash[options]))
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      status, headers, body = app.call(env)
      if status == 404 && env.fetch('PATH_INFO') == config.endpoint
        [config.status_code, {}, ['']]
      else
        [status, headers, body]
      end
    ensure
      body.close if body && body.respond_to?(:close) && $!
    end
  end
end
