class AddConstraints < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false

    change_column_null :articles, :title, false
    change_column_null :articles, :description, false
    change_column_null :articles, :user_id, false
  end
end
