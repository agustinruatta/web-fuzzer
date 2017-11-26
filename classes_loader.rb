class ClassesLoader
  def self.load
    require_relative 'proxy/http_testing_server'
    require_relative 'proxy/server'
    require_relative 'logger/http_logger'
    
    require 'webrick/httpproxy'
  end
end