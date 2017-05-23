class UserAdminsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    @key = user_params[:key]
    @user_admin = UserAdmin.new(email: user_params[:email], password: user_params[:password])
    if @key == "roysenterprise"
      if @user_admin.save
        session[:user_id] = @user_admin.id
        redirect_to user_admins_path
      else
        @errors = @user_admin.errors.full_messages
        render :new
      end
    else
      @errors = ["Invalid registration key."]
      render :new
    end
  end

  

  private
  def user_params
    params.require(:user_admin).permit(:email, :password, :key)
  end
end