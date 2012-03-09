class AddRemoteImageUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :remote_image_url, :string

  end
end
