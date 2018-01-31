class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = "Recipe was created!"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
  
end