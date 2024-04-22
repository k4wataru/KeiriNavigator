class Admin::UsersController < ApplicationController
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
end
