class CreateFillResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :fill_responses do |t|
      t.integer :respondent_id
      t.integer :question_id
      t.string  :answer
      t.timestamps
    end
  end
end
