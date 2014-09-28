class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login
      redirect_to projects_path, notice: "Signed up!"
    else 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @comment = @user.comments.new
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def auto_login
    session[:user_id] = @user.id
    current_user = @user
  end

end
