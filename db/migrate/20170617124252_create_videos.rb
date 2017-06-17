class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.string :context
      t.timestamps
    end
  end
end
