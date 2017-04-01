class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :type
      t.integer :level
      t.timestamps
    end
  end
end
