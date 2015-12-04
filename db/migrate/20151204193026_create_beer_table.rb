class CreateBeerTable < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.boolean :is_organic
      t.decimal :abv
      t.string :brewery_db_id
      t.string :style_name
      t.string :style_short_name
      t.string :name
      t.string :name_display
      t.text :style_description
      t.text :description

      t.timestamps
    end
  end
end
