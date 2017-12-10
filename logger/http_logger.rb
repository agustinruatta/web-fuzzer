module Logger
  # CSV Http Logger
  class HTTPLogger
    DATA_FOLDER = '../data'
    
    def initialize
      @request_formatter = RequestFormatter.new
      @response_formatter = ResponseFormatter.new
    end
  
    # @param [WEBrick::HTTPRequest] request
    # @param [WEBrick::HTTPResponse] response
    def log(request, response)
      request_format = @request_formatter.format(request)

      save_data_in_csv_file(request_format)
    end
    
    private
    
    def save_data_in_csv_file(data)
      CSV.open(get_data_file_path, 'a') do |csv|
        csv << data
      end
    end

    # @return [String]
    def get_data_file_path
      create_data_file unless File.exists? data_file_path

      return data_file_path
    end

    # @return [String]
    def data_file_path
      return DATA_FOLDER + '/logs.csv'
    end

    def create_data_file
      # Create folder if it does not exists
      Dir.mkdir(DATA_FOLDER) unless File.exists?(DATA_FOLDER)

      # Create file
      data_file = File.new(data_file_path, 'w')

      # Write headers on top of file
      data_file.puts(@request_formatter.columns)

      # Save file on disk
      data_file.close
    end
  end
end
