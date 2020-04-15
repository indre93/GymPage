module UsersHelper

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def first_name(user)
    user.first_name
  end
  
end
