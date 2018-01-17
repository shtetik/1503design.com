class AddMetaDescriptionToWork < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :meta_description, :text, null: false, default: ''
  end
end
