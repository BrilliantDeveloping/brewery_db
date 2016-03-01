module BreweryDB
  module Resources
    class Adjuncts < Resource
      def all(params={})
        get('adjuncts', params).paginated_collection
      end

      def find(id, params={})
        get('adjunct/%s' % id, params).data
      end
    end
  end
end
