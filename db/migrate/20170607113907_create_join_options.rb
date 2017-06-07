class CreateJoinOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :join_options do |t|
      t.integer 'response_option_id'
      t.timestamps
    end
  end
end
