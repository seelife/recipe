class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]


  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 8)

  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] ="Success! You created your account."
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @chef.update(chef_params)
      flash[:success] = "Success! You updated your profile."
      redirect_to chef_path(@chef)
    else
      render 'edit'
    end
  end

  def show

    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 10)
  end


    private
      def chef_params
        params.require(:chef).permit(:chefname, :email, :password)
        #code
      end

      def set_chef
        @chef = Chef.find(params[:id])
      end

      def require_same_user

        if current_user != @chef
          flash[:danger] = "Oops! Please only edit your own profile ;-)"
          redirect_to root_path
        end

      end

end
