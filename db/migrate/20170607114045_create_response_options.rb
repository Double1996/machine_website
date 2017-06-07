class CreateResponseOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :response_options do |t|
      t.integer 'question_id'
      t.text 'text'
      t.timestamps
    end
  end
end
