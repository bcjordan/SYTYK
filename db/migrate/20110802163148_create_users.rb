class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :pic_square_with_logo
      t.string :profile_url
      t.integer :level_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
