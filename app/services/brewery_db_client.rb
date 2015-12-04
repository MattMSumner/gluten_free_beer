class BreweryDbClient < SimpleDelegator
  def initialize
    super brewery_db
  end

  private

  def brewery_db
    BreweryDB::Client.new do |config|
      config.api_key = ENV.fetch("BREWERY_DB_API_KEY")
    end
  end
end
