class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :url
      t.string :name
      t.string :desc
      t.timestamps
    end
  end
end
