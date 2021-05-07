class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parent_1 = Category.find(1)
    @parent_2 = Category.find(2)
    @parent_3 = Category.find(3)
    @parent_4 = Category.find(4)
  end

  def show
    @search_word = Post.ransack(params[:q])
    @category = Category.find(params[:id])
    @open_category_posts = @category.posts.where(status: 0).order(created_at: 'desc').page(params[:open_category_post_page]).per(2)
    @close_category_posts = @category.posts.where(status: 1).order(created_at: 'desc').page(params[:close_category_post_page]).per(2)
  end
end
