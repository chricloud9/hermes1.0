class AddUserToDrop < ActiveRecord::Migration
  def change
    add_reference :drops, :user, index: true
    add_foreign_key :drops, :users
    add_column :drops, :recipient_id, :integer
  end
end
