class Admin::UsersController < ApplicationController
 before_action :ensure_guest_user, only: [:edit]
 before_action :authenticate_user!, except: [:show, :index]
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "編集に成功しました。"
      redirect_to admin_user_path
    else
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end
  end
  
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: !@user.is_deleted)
    if @user.is_deleted
      flash[:notice] = "退会処理を実行いたしました"
    else
      flash[:notice] = "有効にします"
    end
    redirect_to admin_user_path
  end
  
  private  
  def user_params
    params.require(:user).permit(:name, :email, :job,  :profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end
