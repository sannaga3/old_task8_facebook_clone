class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def confirm
    @user = User.new(user_params)
    @user.id = params[:id]
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to new_user_path, notice: "ユーザー登録完了しました！"
      else
        render :new
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
