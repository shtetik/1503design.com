class AddAltDescriptionToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :alt_description, :string, null: false, default: ''
  end
end
