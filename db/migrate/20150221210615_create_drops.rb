class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.string :title
      t.decimal :latitude
      t.decimal :longitude
      t.string :landmark
      t.string :item
      t.string :spot
      t.text :description

      t.timestamps null: false
    end
  end
end
