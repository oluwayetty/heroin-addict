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

end
