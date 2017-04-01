class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :type
      t.integer :options
      t.timestamps
    end
  end
end
