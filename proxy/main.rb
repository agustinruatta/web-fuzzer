require '../proxy/http_testing_server'
require '../proxy/proxy'

Thread.new do
  http_testing_server = HTTPTestingServer.new
  http_testing_server.start
end

proxy = Proxy.new