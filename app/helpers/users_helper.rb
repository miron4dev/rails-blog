module UsersHelper

  def user_editable?(user)
    return false if current_user == nil

    current_user == user || current_user.admin?
  end
end
