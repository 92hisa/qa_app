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
    @post_open = current_user.posts.where(status: 0).order(created_at: 'desc').page(params[:post_open_page]).per(10)
    @post_close = current_user.posts.where(status: 1).order(created_at: 'desc').order(created_at: 'desc').page(params[:post_close_page]).per(10)
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update!(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def correct_user
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to root_path
    end
  end
end
