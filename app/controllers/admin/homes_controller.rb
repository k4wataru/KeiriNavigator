class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! #管理者以外に触らせたくないページに記述  
  def top
    @posts = Post.all
  end
end
