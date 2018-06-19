module ChatroomsHelper

  def is_user_creator?(current_user, chatroom)
    chatroom.creator_id == current_user.id
  end
end
