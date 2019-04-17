require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "should be valid" do
    article = Article.new(title: "Some test title", description: "Some description", user: User.first)

    assert article.valid?
  end

  test "title is empty" do
    article = Article.new(title: " ", description: "Some description", user: User.first)

    assert_not article.valid?
  end

  test "title is too short" do
    article = Article.new(title: "s", description: "Some description", user: User.first)

    assert_not article.valid?
  end

  test "title is too long" do
    article = Article.new(title: "Some test title" * 150, description: "Some description", user: User.first)

    assert_not article.valid?
  end

  test "description is empty" do
    article = Article.new(title: "Some test title", description: " ", user: User.first)

    assert_not article.valid?
  end

  test "user is missing" do
    article = Article.new(title: "Some test title", description: "Some description")

    assert_not article.valid?
  end
end
