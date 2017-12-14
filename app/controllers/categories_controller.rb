class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
