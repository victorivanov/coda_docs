module CodaDocs
  module Entities
    class Rows < Entity
      def all(doc_id, table_id, options = nil)
        url = "/docs/#{doc_id}/tables/#{table_id}/rows"
        enumerate_response(url, options)
      end

      def find(doc_id, table_id, row_id)
        connection.get("/docs/#{doc_id}/tables/#{table_id}/rows/#{row_id}")
      end

      def delete(doc_id, table_id, row_id)
        connection.delete("/docs/#{doc_id}/tables/#{table_id}/rows/#{row_id}")
      end
    end
  end
end
