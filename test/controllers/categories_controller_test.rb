require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  include AuthHelper

  def setup
    @category = Category.first
    sign_in_as_admin
  end

  test "should get categories index" do
    get categories_path

    assert_response :success
  end

  test "should get new" do
    get new_category_path

    assert_response :success
  end

  test "should get show" do
    get category_path(@category)

    assert_response :success
  end
end
