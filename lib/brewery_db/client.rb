module BreweryDB
  class Client
    def initialize(&block)
      configure(&block) if block_given?
    end

    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      self
    end

    def beers
      @beers ||= Resources::Beers.new(config)
    end

    # Builds a new instance of the brewery resource.
    #
    # @param id [String] the brewery ID
    # @return <Resources::Breweries> an instance of the brewery resource
    def brewery(id)
      Resources::Brewery.new(config, id: id)
    end

    def adjuncts
      @adjuncts ||= Resources::Adjuncts.new(config)
    end

    def breweries
      @breweries ||= Resources::Breweries.new(config)
    end

    def categories
      @categories ||= Resources::Categories.new(config)
    end

    def fermentables
      @fermentables ||= Resources::Fermentables.new(config)
    end

    def fluid_size
      @fluid_size ||= Resources::FluidSize.new(config)
    end

    def glassware
      @glassware ||= Resources::Glassware.new(config)
    end

    def hops
      @hops ||= Resources::Hops.new(config)
    end

    def ingredients
      @ingredients ||= Resources::Ingredients.new(config)
    end

    def locations
      @locations ||= Resources::Locations.new(config)
    end

    def menu
      @menu ||= Resources::Menu.new(config)
    end

    def search
      @search ||= Resources::Search.new(config)
    end

    def styles
      @styles ||= Resources::Styles.new(config)
    end

    def yeasts
      @yeasts ||= Resources::Yeasts.new(config)
    end
  end
end
