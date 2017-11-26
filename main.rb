require_relative 'classes_loader'
ClassesLoader.load

Thread.new do
  http_testing_server = Proxy::HTTPTestingServer.new
  http_testing_server.start
end

proxy = Proxy::Server.new