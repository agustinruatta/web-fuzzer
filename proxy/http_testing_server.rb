module Proxy
  class HTTPTestingServer
    def initialize(port: 8000, response_body: 'OK!')
      @server = WEBrick::HTTPServer.new(
        :Port => port,
      )
    
      @server.mount_proc '/' do |req, res|
        res.body = response_body
      end
    end
    
    def start
      @server.start
    end
    
    def stop
      @server.shutdown
    end
end
end
