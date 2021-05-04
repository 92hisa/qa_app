class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @parent_1 = Category.find(1)
    @parent_2 = Category.find(2)
    @parent_3 = Category.find(3)
    @parent_4 = Category.find(4)
  end
end
