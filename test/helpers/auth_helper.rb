module AuthHelper

  def sign_in_as_user
    post login_path, params: {session: {email: 'user@example.com', password: 'MyString'}}
  end

  def sign_in_as_user2
    post login_path, params: {session: {email: 'user2@example.com', password: 'MyString'}}
  end

  def sign_in_as_admin
    post login_path, params: {session: {email: 'admin@example.com', password: 'MyString'}}
  end

  def logout
    delete logout_path
  end

end
