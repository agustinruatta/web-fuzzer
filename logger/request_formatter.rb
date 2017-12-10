module Logger
  module CSVColumns
    REQUEST_TIME = 'request_time'
    HOST = 'host'
    HTTP_METHOD = 'http_method'
    HTTP_VERSION = 'http_version'
    URI = 'uri'
    USER_AGENT = 'user_agent'
    #PROXY_CONNECTION = 'proxy_connection'
    COOKIES = 'cookies'
    ACCEPT = 'accept'
  end
  
  class RequestFormatter
    # @param [WEBrick::HTTPRequest] request
    # @return [Array] Array of objects to save
    def format(request)
      return [
          'REQUEST',
          request_time(request),
          host(request),
          http_method(request),
          http_version(request),
          uri(request),
          user_agent(request),
          cookies(request),
          accept(request),
      ]
    end
    
    def columns
      return [
          "\"#{CSVColumns::REQUEST_TIME}\",\"#{CSVColumns::HOST}\",\"#{CSVColumns::HTTP_METHOD}\"," + 
              "\"#{CSVColumns::HTTP_VERSION}\",\"#{CSVColumns::URI}\",\"#{CSVColumns::USER_AGENT}\"," +
              "\"#{CSVColumns::COOKIES}\",\"#{CSVColumns::ACCEPT}\""
      ]
    end
    
    private

    # @param [WEBrick::HTTPRequest] request
    def request_time(request)
      return request.request_time
    end

    # @param [WEBrick::HTTPRequest] request
    # @return string
    def host(request)
      return request.header['host'][0].class
    end

    # @param [WEBrick::HTTPRequest] request
    def http_method(request)
      return request.request_method
    end

    # @param [WEBrick::HTTPRequest] request
    def http_version(request)
      return request.http_version.to_s
    end

    # @param [WEBrick::HTTPRequest] request
    # @return string
    def uri(request)
      return request.unparsed_uri
    end
    
    def user_agent(request)
      return ''
    end

    # @param [WEBrick::HTTPRequest] request
    # @return string
    def cookies(request)
      return request.cookies
    end
    
    def accept(request)
      return ''
    end
  end
end