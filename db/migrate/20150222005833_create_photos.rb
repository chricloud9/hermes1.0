class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :drop, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :drops
  end
end
