module ApplicationHelper

  def nav_item_class(*active_current_pages)
    [cycle("blog-nav-item"), ('active' if active_current_pages.any?(&method(:current_page?)))]
  end
end
