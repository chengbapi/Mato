class AddApprovedToFriendsrelationships < ActiveRecord::Migration
  def change
    add_column :friendships, :approved, :boolean, :default => false

  end
end
