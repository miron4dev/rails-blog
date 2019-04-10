class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :user_id, :integer
    add_index :articles, :user_id
    add_foreign_key :articles, :users
  end
end
