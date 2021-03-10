class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    @user.id = params[:id]
    render :new if @user.invalid?
  end
  
  def show
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
