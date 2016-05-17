class AddImageIdToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :identities, :image_id
    add_column :users, :image_id, :string
  end
end
