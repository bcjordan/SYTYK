class CreateBeens < ActiveRecord::Migration
  def self.up
    create_table :beens do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :rating
      t.boolean :yes
      t.boolean :no
      t.boolean :want
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :beens
  end
end
