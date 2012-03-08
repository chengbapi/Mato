class Messeges < ActiveRecord::Migration
  def change
      create_table :messeges do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string :content
      t.timestamps
    end

  end
end
