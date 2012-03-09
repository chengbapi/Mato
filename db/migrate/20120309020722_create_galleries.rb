class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
