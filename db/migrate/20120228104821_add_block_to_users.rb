class AddBlockToUsers < ActiveRecord::Migration
  def change
    add_column :friendships, :blocked_id , :integer
    add_column :friendships, :blocked    , :boolean ,:default => false
  end
end
