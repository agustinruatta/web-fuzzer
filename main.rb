require_relative 'classes_loader'
ClassesLoader.load

Thread.new do
  http_testing_server = Proxy::HTTPTestingServer.new
  http_testing_server.start
end

# Debug with `curl -x localhost:8080 http://localhost:8000`
proxy = Proxy::Server.new