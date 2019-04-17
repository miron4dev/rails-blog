require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user should be valid" do
    user = User.new(email: "testuser@example.com", username: "testuser", password: "qwerty1234")

    assert user.valid?
  end

  test "email is empty" do
    user = User.new(email: " ", username: "testuser", password: "qwerty1234")

    assert_not user.valid?
  end

  test "email already exists" do
    user = User.new(email: "user@example.com", username: "testuser", password: "qwerty1234")

    assert_not user.valid?
  end

  test "email in wrong format" do
    user = User.new(email: "testuser@example", username: "testuser", password: "qwerty1234")

    assert_not user.valid?
  end

  test "email too big" do
    user = User.new(email: "testuser@example.com" * 10, username: "testuser", password: "qwerty1234")

    assert_not user.valid?
  end

  test "username is empty" do
    user = User.new(email: "testuser@example.com", username: " ", password: "qwerty1234")

    assert_not user.valid?
  end

  test "username already exists" do
    user = User.new(email: "testuser@example.com", username: "user", password: "qwerty1234")

    assert_not user.valid?
  end

  test "username is too short" do
    user = User.new(email: "testuser@example.com", username: "t", password: "qwerty1234")

    assert_not user.valid?
  end

  test "username is too long" do
    user = User.new(email: "testuser@example.com", username: "testuser" * 15, password: "qwerty1234")

    assert_not user.valid?
  end

  test "password is empty" do
    user = User.new(email: "testuser@example.com", username: "testuser", password: " ")

    assert_not user.valid?
  end

  test "password is too short" do
    user = User.new(email: "testuser@example.com", username: "testuser", password: "q")

    assert_not user.valid?
  end

  test "password is too long" do
    user = User.new(email: "testuser@example.com", username: "testuser", password: "qwerty1234" * 100)

    assert_not user.valid?
  end
end
