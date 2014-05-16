class IngredientsController < ApplicationController

  before_action :set_params, only: [:create]

  def new
    @ingredient = Ingredient.new
  end

  def create
    Ingredient.create(@params)
    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def destroy
  end

  private

  def set_params
    @params = params.require(:ingredient).permit(:name, :photo_url)
  end

end
