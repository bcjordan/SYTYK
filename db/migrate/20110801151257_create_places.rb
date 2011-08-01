class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :location_name
      t.decimal :lat, :precision => 10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6
      t.string :url
      t.string :image_url
      t.string :category
      t.decimal :rating
      t.integer :ranking
      t.integer :location_id
      t.integer :num_reviews
      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
