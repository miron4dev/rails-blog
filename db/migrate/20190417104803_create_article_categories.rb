class CreateArticleCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :article_categories do |t|
      t.integer :article_id, null: false
      t.integer :category_id, null: false
    end
  end
end
