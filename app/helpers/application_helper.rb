module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_supporter?(user)
    user.supporter? ? true : false
  end

  def all_users_except_current_user
    (User.all - [current_user]).sort_by(&:username)
  end

  def current_user_last_mood
    current_user.daily_moods.last.mood.upcase
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
