class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @kaden = Category.find_by(name: "家電")
  end
end
