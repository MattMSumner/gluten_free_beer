class CreateBeerTable < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.boolean :is_organic
      t.decimal :abv
      t.json :images
      t.string :brewery_db_id
      t.string :name
      t.string :name_display
      t.string :style_name
      t.string :style_short_name
      t.text :description
      t.text :style_description

      t.timestamps
    end
  end
end
