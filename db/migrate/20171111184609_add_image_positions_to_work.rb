class AddImagePositionsToWork < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :image_positions, :json, null: false, default: '{}'
  end
end
