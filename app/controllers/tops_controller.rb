class TopsController < ApplicationController
  def index
    @recent_posts = Post.where(status: 0).order(created_at: 'desc')
  end
end
