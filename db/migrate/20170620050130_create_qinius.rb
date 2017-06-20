class CreateQinius < ActiveRecord::Migration[5.0]
  def change
    create_table :qinius do |t|
      t.string :url

      t.timestamps
    end
  end
end
