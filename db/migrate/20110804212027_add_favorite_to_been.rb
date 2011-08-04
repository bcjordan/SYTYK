class AddFavoriteToBeen < ActiveRecord::Migration
  def self.up
    add_column :beens, :favorite, :boolean
  end

  def self.down
    remove_column :beens, :favorite
  end
end
