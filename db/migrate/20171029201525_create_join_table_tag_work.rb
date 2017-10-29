class CreateJoinTableTagWork < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :works do |t|
      t.index [:tag_id, :work_id]
      t.index [:work_id, :tag_id]
    end
  end
end
