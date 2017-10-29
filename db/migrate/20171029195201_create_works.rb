class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.string :caption, null: false
      t.text :text, null: false
      t.string :link
      t.integer :year, null: false

      t.timestamps
    end

    add_index :works, :name, unique: true
  end
end
