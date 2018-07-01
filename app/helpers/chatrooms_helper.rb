module ChatroomsHelper

  def is_user_creator?(current_user, chatroom)
    chatroom.creator_id == current_user.id
  end

  def user_supporters
    current_user.supporters
  end

  def user_addicts
    current_user.addicts
  end
end
