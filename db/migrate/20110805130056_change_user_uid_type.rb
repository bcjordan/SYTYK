class ChangeUserUidType < ActiveRecord::Migration
  def self.up
    change_column :users, :uid, :string
  end

  def self.down
    change_column :users, :uid, :integer
  end
end
