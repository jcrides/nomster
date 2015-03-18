class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :caption
      t.integer :place_id

      t.timestamps null: false
    end
    add_index :photos, :place_id
  end
end
