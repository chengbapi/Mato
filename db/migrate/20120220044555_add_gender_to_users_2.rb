class AddGenderToUsers2 < ActiveRecord::Migration
  def change
    add_column :users, :identity, :integer

  end
end
