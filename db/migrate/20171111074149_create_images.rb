class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :work, foreign_key: true
      t.attachment :img
      t.integer :kind, null: false, default: 0
      t.boolean :half, null: false, default: false

      t.timestamps
    end
  end
end
