module UsersHelper

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def user_first_name
    user.first_name
  end
  
end
