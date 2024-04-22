class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]
    @word = params[:word]
    @search_type = params[:search_type]

  if @range == "ユーザー"
    @users = User.looks(@search_type, @word)
  elsif @range == "投稿"
    @posts = Post.looks(@search_type, @word)
  else
    @comments = Comment.looks(@search_type, @word)
  end
  end
end
