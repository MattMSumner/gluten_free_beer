class BeerFetcher
  def fetch
    beers.each do |beer|
      persisted_beer = Beer.find_by(brewery_db_id: beer.id) || Beer.new
      persisted_beer.update(map_attributes(beer))
    end
  end

  private

  def beers
    @beers ||= client.search.beers(q: "gulten free")
  end

  def client
    @client ||= BreweryDbClient.new
  end

  def map_attributes(beer)
    {
      abv: beer.abv.to_f,
      brewery_db_id: beer.id,
      description: beer.description,
      is_organic: beer.is_organic == "Y",
      name: beer.name,
      name_display: beer.name_display,
      style_description: beer.style && beer.style.description,
      style_name: beer.style && beer.style.name,
      style_short_name: beer.style && beer.style.short_name,
    }
  end
end
