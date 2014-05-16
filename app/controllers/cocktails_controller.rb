class CocktailsController < ApplicationController

  before_action :set_params, only: [:create]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    Cocktail.create(@params)
    redirect_to cocktails_path
  end

  def destroy
    Cocktail.find(params[:id]).destroy
    redirect_to cocktails_path
  end

  private

  def set_params
    @params = params.require(:cocktail).permit(:name, :photo_url, :description, dosages_attributes: [:ingredient_id, :quantity])
  end

end

