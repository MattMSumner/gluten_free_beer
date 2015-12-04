require "rails_helper"

describe BreweryDbClient do
  describe "#initialize" do
    it "decorates a new instance of BreweryDB::Client" do
      ClimateControl.modify BREWERY_DB_API_KEY: "some_key" do
        allow(BreweryDB::Client).to receive(:new)

        BreweryDbClient.new

        expect(BreweryDB::Client).to have_received(:new)
      end
    end
  end
end
