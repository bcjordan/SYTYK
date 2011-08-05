class ChangeUserUidType < ActiveRecord::Migration
  def self.up
    change_column :users, :uid, :text
  end

  def self.down
    change_column :users, :uid, :integer
  end
end
