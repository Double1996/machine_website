class AddStudentToRespondents < ActiveRecord::Migration[5.0]
  def change
    add_column :respondents, :student_id, :integer
    add_column :respondents, :student_name, :string
  end
end
