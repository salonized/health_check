module HealthCheck
  class Middleware
    class << self
      def default_options
        {
          endpoint: '/ping',
          response_status: 200,
          response_body: 'OK',
        }
      end
    end

    attr_reader :app, :config

    def initialize(app, options = {})
      @app = app
      @config = OpenStruct.new(self.class.default_options.merge(Hash[options]))
    end

    def call(env)
      if env["PATH_INFO"] == config.endpoint
        [status, {"Content-Type" => "text/html", "Content-Length" => body.length}, [body]]
      else
        @app.call(env)
      end
    end

    private

    def body
      @body ||= config.response_body.to_s
    end

    def status
      @status ||= config.response_status
    end
  end
end
