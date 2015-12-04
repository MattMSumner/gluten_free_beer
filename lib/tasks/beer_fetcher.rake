namespace :beer do
  desc "Fetchs all the gluten free beers from brewerydb"
  task fetch: :environment do
    BeerFetcher.new.fetch
  end
end
