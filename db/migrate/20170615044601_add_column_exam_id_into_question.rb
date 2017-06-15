class AddColumnExamIdIntoQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :exam_id, :integer
    add_index :questions, :exam_id
  end
end
