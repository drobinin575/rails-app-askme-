module UsersHelper
  def at_nickname
    "@#{current_user.nickname}"
  end
end
