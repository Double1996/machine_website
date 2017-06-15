class CreateMultiResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :multi_responses do |t|
      t.integer :respondent_id
      t.integer :question_id
      t.timestamps
    end
  end
end
