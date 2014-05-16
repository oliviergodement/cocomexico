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
    @ingredient = Ingredient.find(params[:id])
    @cocktails = []
    Dosage.where(ingredient_id: params[:id]).each do |dosage|
      if Cocktail.exists?(dosage.cocktail_id)
        @cocktails << Cocktail.find(dosage.cocktail_id)
      end
    end
  end

  def destroy
  end

  private

  def set_params
    @params = params.require(:ingredient).permit(:name, :photo_url)
  end

end
