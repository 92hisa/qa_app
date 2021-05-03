class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, except: [:show]

  def show
    @user = User.find_by(id: params[:id])
  end

  def post_list
    @post_list = current_user.posts
  end

  def correct_user
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to root_path
    end
  end
end
