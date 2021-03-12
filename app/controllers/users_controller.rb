class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :confirm]
  before_action :set_user, only: [:edit, :show, :update,:destroy]
  def new
    @user = User.new
  end
  
  def confirm
    @user = User.new(user_params)
    @user.id = params[:id]
    if @user.id?
      render :edit if @user.invalid?(:edit_case)
    else
      render :new if @user.invalid?(:new_case)
    end
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "ユーザー登録完了しました！"
      else
        render :new
      end
    end
  end
  
  def show
  end

  def edit
  end

  def update
    @user.id = params[:id]
    if params[:back]
      render :edit
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "ユーザー編集完了しました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice: "ご利用ありがとうございました！登録情報を削除しました！"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
