class AdminSessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end


  def create
    @user_admin = UserAdmin.authenticate(session_params[:email], session_params[:password])
    if @user_admin
      session[:user_id] = @user_admin.id
      redirect_to user_admins_path
    else
      @errors = ["That User does not exist."]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_admins_path
  end

  private
  def session_params
    params.require(:admin_session).permit(:email, :password)
  end

end