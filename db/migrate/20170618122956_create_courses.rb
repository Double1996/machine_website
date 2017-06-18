class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :status, null: false, index: true
      t.attachment :upload
      t.boolean :visible, default: false, null: false
      t.timestamps
    end
  end
end
