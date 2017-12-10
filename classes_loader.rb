class ClassesLoader
  def self.load
    # Project classes
    require_relative 'proxy/http_testing_server'
    require_relative 'proxy/server'
    require_relative 'logger/http_logger'
    require_relative 'logger/request_formatter'
    require_relative 'logger/response_formatter'

    # Gem files
    require 'csv'
    require 'webrick/httpproxy'
  end
end