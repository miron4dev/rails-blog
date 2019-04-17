require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "category should be valid" do
    category = Category.new(name: "Techno")
    assert category.valid?
  end

  test "name is empty" do
    category = Category.new(name: " ")
    assert_not category.valid?
  end

  test "name already exists" do
    category = Category.new(name: "Sports")

    assert_not category.valid?
  end

  test "name should not be too long" do
    category = Category.new(name: "a" * 26)

    assert_not category.valid?
  end

  test "name should not be too short" do
    category = Category.new(name: "qw")

    assert_not category.valid?
  end
end
