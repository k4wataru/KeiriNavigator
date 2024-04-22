class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    @search_type = params[:search_type]

    if @range == "User"
      @users = User.looks(@search_type, @word)
    else
      @posts = Post.looks(@search_type, @word)
    end
  end
end
