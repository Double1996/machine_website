class RemoveContextToQuestion < ActiveRecord::Migration[5.0]
  def up
    add_column :questions, :text, :text
  end

  def down
    remove_column :content
  end
end
