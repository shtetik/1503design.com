class AddHasClientToWork < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :has_client, :boolean, null: false, default: false
  end
end
