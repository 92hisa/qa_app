class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parent_1 = Category.find(1)
    @parent_2 = Category.find(2)
    @parent_3 = Category.find(3)
    @parent_4 = Category.find(4)
    @parent_5 = Category.find(5)
    @parent_6 = Category.find(6)
    @parent_7 = Category.find(7)
    @parent_8 = Category.find(8)
    @parent_9 = Category.find(9)
    @parent_10 = Category.find(10)
    @parent_11 = Category.find(11)
    @parent_12 = Category.find(12)
    @parent_13 = Category.find(13)
    @parent_14 = Category.find(14)
    @parent_15 = Category.find(15)
    @parent_16 = Category.find(16)
    @parent_17 = Category.find(17)
    @parent_18 = Category.find(18)
    @parent_19 = Category.find(19)
    @parent_20 = Category.find(20)
    @parent_21 = Category.find(21)
    @parent_22 = Category.find(22)
    @parent_23 = Category.find(23)
    @parent_24 = Category.find(24)
    @parent_25 = Category.find(25)
    @parent_26 = Category.find(26)
    @parent_27 = Category.find(27)
    @parent_28 = Category.find(28)
    @parent_29 = Category.find(29)
  end

  def show
    @search_word = Post.ransack(params[:q])
    @category = Category.find(params[:id])
    @open_category_posts = @category.posts.where(status: 0).order(created_at: 'desc').page(params[:open_category_post_page]).per(2)
    @close_category_posts = @category.posts.where(status: 1).order(created_at: 'desc').page(params[:close_category_post_page]).per(2)
  end
end
