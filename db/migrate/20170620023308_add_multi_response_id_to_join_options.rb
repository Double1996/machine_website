class AddMultiResponseIdToJoinOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :join_options, :multi_response_id, :integer
  end
end

