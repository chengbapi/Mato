class AddAvatarToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :avatar_gallery, :boolean,:default => false

  end
end
