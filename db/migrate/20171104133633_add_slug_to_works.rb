class AddSlugToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :slug, :string, null: false, default: ''
    add_index :works, :slug, unique: true
  end
end
