require 'webrick'
require 'webrick/httpproxy'

class Proxy
  def initialize
    @proxy = WEBrick::HTTPProxyServer.new Port: 8080
  
    trap 'INT'  do @proxy.shutdown end
    trap 'TERM' do @proxy.shutdown end
  
    @proxy.start
  end
end