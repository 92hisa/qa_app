class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, except: [:show]

  def show
    @user = User.find(params[:id])
    @user_open_posts = @user.posts.where(status: 0).order(created_at: 'desc')
  end

  def post_list
    @post_list = current_user.posts
    @answer_list = current_user.answers
  end

  def mypage
    @user = current_user
  end

  def correct_user
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to root_path
    end
  end
end
