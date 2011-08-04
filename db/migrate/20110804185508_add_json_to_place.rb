class AddJsonToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :json, :text
  end

  def self.down
    remove_column :places, :json
  end
end
