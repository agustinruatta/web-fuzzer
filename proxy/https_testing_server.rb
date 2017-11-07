require 'webrick'
require 'webrick/https'

class HTTPSTestingServer
  def initialize
    cert_name = [
      %w[CN localhost],
    ]
  
    @server = WEBrick::HTTPServer.new(
      :Port => 8443,
      :SSLEnable => true,
      :SSLCertName => cert_name
    )
  
    @server.mount_proc '/' do |req, res|
      res.body = 'Example Domain Encrypted'
    end
  end
  
  def start
    @server.start
  end
  
  def end
    @server.stop
  end
end