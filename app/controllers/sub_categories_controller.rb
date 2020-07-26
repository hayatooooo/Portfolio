class SubCategoriesController < ApplicationController

  def index
    #Ajaxのリクエストを受け取り、JSONを返す
    category = Category.find(params[:category_id])
    render json: category.sub_categories.select(:id, :name)
  end
end