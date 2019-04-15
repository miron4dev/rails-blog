module ArticlesHelper

  def article_editable?(article)
    return false if current_user == nil

    current_user == article.user || current_user.admin?
  end
end
