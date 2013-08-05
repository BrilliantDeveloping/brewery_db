module BreweryDB
  module Resources
    class Fermentables < Resource
      def all(params={})
        get('fermentables', params).collection
      end

      def find(id, params={})
        get('fermentable/%s' % id, params).data
      end
    end
  end
end
