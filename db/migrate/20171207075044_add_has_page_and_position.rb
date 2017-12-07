class AddHasPageAndPosition < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :has_page, :boolean, null: false, default: false
    add_column :works, :position, :integer
  end
end
