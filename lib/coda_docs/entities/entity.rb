module CodaDocs
  module Entities
    class Entity
      def initialize(access_token)
        @access_token = access_token
      end

      def parse_response(response)
        response.parsed_response['items']
      end

      def enumerate_response(url, options)
        Enumerator.new do |y|
          loop do
            response = connection.get(url, query: options)
            parse_response(response).each do |item|
              y.yield item
            end
            if response['nextPageToken']
              (options ||= {})[:pageToken] = response['nextPageToken']
            else
              break
            end
          end
        end
      end

      def connection
        conn = CodaDocs::Connection
        conn.default_options.merge!(
          headers: {
            'Authorization' => "Bearer #{@access_token}",
            'Content-Type' => 'application/json'
          }
        )
        conn
      end
    end
  end
end


