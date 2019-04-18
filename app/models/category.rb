class Category < ApplicationRecord

  has_many :article_categories, dependent: :delete_all
  has_many :articles, through: :article_categories

  validates :name, uniqueness: true, presence: true, length: {minimum: 3, maximum: 25}
end
