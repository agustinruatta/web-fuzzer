module Proxy
  class Server
    def initialize
      @http_logger = Logger::HTTPLogger.new
      
      @proxy = WEBrick::HTTPProxyServer.new(Port: 8080, ProxyContentHandler: get_handler)
    
      trap 'INT'  do @proxy.shutdown end
      trap 'TERM' do @proxy.shutdown end
    
      @proxy.start
    end
    
    private 
    def get_handler
      proc do |request, response|
        @http_logger.log(request, response)
      end
    end
  end
end