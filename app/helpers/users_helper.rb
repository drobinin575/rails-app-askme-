module UsersHelper
  def display_at_sign(user)
    "@#{user.nickname}"
  end
end
