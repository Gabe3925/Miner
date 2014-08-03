require 'pry'

class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create, :update_tool]
  before_action :find_user, only: [:show, :edit, :destroy]
  before_action :require_current_user, except: [:index, :new, :create, :update_dollars, :update_tool, :museum]

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

  def museum
    user_array = []
    mines = Mine.all

    mines.each do |mine|
      array = Array.new
      if mine.depth >= 0
        array<<mine.name.capitalize
        array<<mine.depth
        mine_owner_id = mine.user_id
        user = User.find(mine_owner_id)
        array<<user.name.capitalize
        user_array<<array
      end
    end

    # using [1] to indicate we want to sort by mine depth...
    @user_array = user_array.sort {|a,b| b[1] <=> a[1]}

  end

  # Updates dollars as a user mines...
  def update_dollars
    @user = User.find(params[:user_id])
    new_dollars = params[:updatedFunds]
    #store to database
    @user.dollars = new_dollars.to_i
    @user.save
  end

  # Updates dollars and tool id when a user goes shopping in 'store'...
  def update_tool

    @user = User.find(params[:user_id])
    @tool = Tool.find(params[:toolId])
    price = @tool.price

    # subtract tool price from users dollars
    if @user.dollars <= price

      respond_to do |format|
        msg = { :status => "error", :message => "You do not have enough money to buy that!", :html => "No Sale" }
        format.json  { render :json => msg }
      end

    else

      @user.dollars = @user.dollars - price

      # re-assign users tool_id reference ID
      @user.tool_id = @tool.id

      #store to database
      @user.save

      #success sends a confirmation back to store
      respond_to do |format|
        msg = { :status => "success", :message => "You purchased a " + @tool.name + ".", :html => "Purchase complete" }
        format.json  { render :json => msg }
      end
    end
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
