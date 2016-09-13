class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 10)

  end

  def show

  end

  def new
    @recipe = Recipe.new

  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Success! You added a recipe."
      redirect_to recipe_path(@recipe)
    else
      render :new
    end


  end

  def edit

  end

  def update
      if @recipe.update(recipe_params)
        flash[:success] = "Success! You updated your recipe."
        redirect_to recipe_path(@recipe)
      else
        render :edit
      end
  end

  def like
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid?

      flash[:success] = "Success! You did it!"
      redirect_to :back
    else
      flash[:danger] = "Oops! Please like/dislike only once."
      redirect_to :back
    end
  end
  private

      def recipe_params
        params.require(:recipe).permit(:name, :summary, :description, :picture)
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def require_same_user

        if current_user != @recipe.chef
          flash[:danger] = "Oops! You are only able to edit your own recipes ;-)"
          redirect_to recipes_path
        end

      end
end
