module HealthCheck
  class Background
    def initialize(port: 8000, message: nil)
      @port = port
      @server = TCPServer.new(port)
      @message = message

      Thread.abort_on_exception = true
      Thread.kill(thread) if thread && thread.alive?

      @thread = Thread.new { run }
    end

    def run
      loop do
        client = server.accept
        client.puts(message) if message.present?
        client.close
      end
    end
  end
end
