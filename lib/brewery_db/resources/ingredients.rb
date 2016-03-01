module BreweryDB
  module Resources
    class Ingredients < Resource
      def all(params={})
        get('ingredients', params).paginated_collection
      end

      def find(id, params={})
        get('ingredient/%s' % id, params).data
      end
    end
  end
end
