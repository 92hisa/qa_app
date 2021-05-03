class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_post_user, only: [:edit, :update, :destroy]

  def index
    @post = Post.all.order(created_at: 'desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash[:notice] = "投稿が保存されました"
      redirect_to root_path
    else
      render 'new'
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update!(post_params)
      flash[:notice] = "編集が完了しました"
      redirect_to post_list_user_path(id: current_user.id)
    else
      flash[:alert] = "編集できませんでした"
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :post_image, :status).merge(user_id: current_user.id)
  end

  def correct_post_user
    post = Post.find_by(id: params[:id])
    if post.user.id != current_user.id
       redirect_to root_path
    end
  end
end
