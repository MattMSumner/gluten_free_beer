require "rails_helper"

describe BeerFetcher do
  describe "#fetch" do
    context "no existing beers" do
      it "creates a beer for each result with the correct attributes" do
        results = double(:results, beers: [beer])
        client = double(:client, search: results)
        allow(BreweryDbClient).to receive(:new).and_return(client)

        expect { BeerFetcher.new.fetch }.to change { Beer.count }.from(0).to(1)

        beer = Beer.last

        expect(beer.abv).to eq(6.2)
        expect(beer.brewery_db_id).to eq("oDjg7T")
        expect(beer.description).to eq("Beer description")
        expect(beer.is_organic).to eq(true)
        expect(beer.name).to eq("Free Beer")
        expect(beer.name_display).to eq("Free Beer")
        expect(beer.style_description).to eq("Style description")
        expect(beer.style_name).to eq("American-Style India Pale Ale")
        expect(beer.style_short_name).to eq("American IPA")
        expect(beer.images).to eq(
          "icon" => "https://fake.com/U8YQ9F/upload_RGReeg-icon.png",
          "large" => "https://fake.com/U8YQ9F/upload_RGReeg-large.png",
          "medium" => "https://fake.com/U8YQ9F/upload_RGReeg-medium.png"
        )
      end
    end

    context "with duplicates" do
      it "only creates a single beer" do
        results = double(:results, beers: [beer, beer])
        client = double(:client, search: results)
        allow(BreweryDbClient).to receive(:new).and_return(client)

        expect { BeerFetcher.new.fetch }.to change { Beer.count }.from(0).to(1)
      end
    end
  end

  def beer
    category = BreweryDB::Mash.new({
      create_date: "2012-03-21 20:06:45",
      id: 3,
      name: "North American Origin Ales"
    })

    style = BreweryDB::Mash.new({
      abv_max: "7.5",
      abv_min: "6.3",
      category: category,
      category_id: 3,
      create_date: "2012-03-21 20:06:45",
      description: "Style description",
      fg_max: "1.018",
      fg_min: "1.012",
      ibu_max: "70",
      ibu_min: "50",
      id: 30,
      name: "American-Style India Pale Ale",
      og_min: "1.06",
      short_name: "American IPA",
      srm_max: "14",
      srm_min: "6",
      update_date: "2015-04-07 15:26:37"
    })

    labels = BreweryDB::Mash.new({
      icon: "https://fake.com/U8YQ9F/upload_RGReeg-icon.png",
      large: "https://fake.com/U8YQ9F/upload_RGReeg-large.png",
      medium: "https://fake.com/U8YQ9F/upload_RGReeg-medium.png"
    })

    BreweryDB::Mash.new({
      abv: "6.2",
      create_date: "2015-05-20 16:49:41",
      description: "Beer description",
      id: "oDjg7T",
      is_organic: "Y",
      labels: labels,
      name: "Free Beer",
      name_display: "Free Beer",
      status: "verified",
      status_display: "Verified",
      style: style,
      style_id: 30,
      type: "beer",
      update_date: "2015-05-20 16:49:41"
    })
  end
end
