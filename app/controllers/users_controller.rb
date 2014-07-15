require 'pry'

class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]
  before_action :find_user, only: [:show, :edit, :destroy]
  before_action :require_current_user, except: [:index, :new, :create, :update_dollars, :update_tool]

  # This is the store page:
  def index
    @user = User.find(params[:id])
    @tool = Tool.find(@user.tool_id)
    @tools = Tool.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to new_user_mine_path(@user)

    else
      render :new
    end
  end

  # This is 'Headquarters', HQ...
  def show
    #user found as before-action
    @mine = @user.mines.first
    @tool = Tool.find(@user.tool_id)
  end

  def edit
  end

  def update_dollars
    @user = User.find(params[:user_id])
    new_dollars = params[:updatedFunds]
    #store to database
    @user.dollars = new_dollars.to_i
    @user.save
  end

  def update_tool
    binding.pry
    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:toolId])
    price = @tool.price

    # subtract tool price from users dollars
    @user.dollars = @user.dollars - price

    # re-assign users tool_id reference ID
    @user.tool_id = @tool.id

    #store to database
    @user.save
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation
    )
  end

  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end
  end

end
