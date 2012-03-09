class AddPhotoToGallery < ActiveRecord::Migration
  def change
    drop_table :photos
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :comment_count ,:default => 0
      t.integer :gallery_id
      t.timestamps

    end
  end
end
