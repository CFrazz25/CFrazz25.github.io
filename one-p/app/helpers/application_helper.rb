module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current = UserAdmin.find_by(id: session[:user_id]) if logged_in?
  end

  # def set_user(user)
  #   session[:user_id] = user.id
  # end

  # def owner?(user_id)
  #   session[:user_id] == user_id
  # end
end
