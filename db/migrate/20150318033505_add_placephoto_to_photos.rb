class AddPlacephotoToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :placephoto, :string
  end
end
