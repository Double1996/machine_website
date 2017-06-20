class AddResultsToRespondents < ActiveRecord::Migration[5.0]
  def change
    add_column :respondents, :results, :integer
  end
end
