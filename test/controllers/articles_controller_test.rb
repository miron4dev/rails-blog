require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  include AuthHelper

  def setup
    @article = load_article('user')

    sign_in_as_user
  end

  test "should get index" do
    get articles_url

    assert_response :success
  end

  test "should get new" do
    get new_article_url

    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: {article: {title: 'Some title', description: 'Some description'}}
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should not create article, because anonymous" do
    logout

    assert_no_difference('Article.count') do
      post articles_url, params: {article: {title: 'Some title', description: 'Some description'}}
    end

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should show article" do
    get article_url(@article)

    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)

    assert_response :success
  end

  test "should not get edit, because anonymous" do
    logout

    get edit_article_url(@article)

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should get edit, because user is admin" do
    sign_in_as_admin
    get edit_article_url(@article)

    assert_response :success
  end

  test "should not get edit, because user is not an author" do
    @article = load_article('admin')

    get edit_article_url(@article)

    assert_not_empty(flash[:alert])
    assert_redirected_to article_url(@article)
  end

  test "should update article" do
    patch article_url(@article), params: {article: {title: 'Some updated title', description: 'Some updated description'}}

    assert_redirected_to article_url(@article)
  end

  test "should not update article, because anonymous" do
    logout

    patch article_url(@article), params: {article: {title: 'Some updated title', description: 'Some updated description'}}

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should not update article, because user is not an author" do
    @article = load_article('admin')

    patch article_url(@article), params: {article: {title: 'Some updated title', description: 'Some updated description'}}

    assert_not_empty(flash[:alert])
    assert_redirected_to article_url(@article)
  end

  test "should update article, because user is admin" do
    sign_in_as_admin

    patch article_url(@article), params: {article: {title: 'Some updated title', description: 'Some updated description'}}

    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  test "should not destroy article, because anonymous" do
    logout

    assert_no_difference('Article.count') do
      delete article_url(@article)
    end

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should not destroy article, because user is not an author" do
    @article = load_article('admin')

    assert_no_difference('Article.count') do
      delete article_url(@article)
    end

    assert_not_empty(flash[:alert])
    assert_redirected_to article_url(@article)
  end

  test "should destroy article, because user is admin" do
    sign_in_as_admin

    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  private

  def load_article(username)
    user = User.where(:username => username).first

    Article.where(:user => user).first
  end
end
