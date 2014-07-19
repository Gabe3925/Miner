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

  # For the user hall of fame
  def museum
    @user_array = []
    users = User.all
    users.each do |user|
      array = Array.new
      array<<user.name
      array<<user.dollars
      user_id = user.id
      mine = Mine.find(user_id)
      array<<mine.name
      array<<mine.depth
      @user_array<<array
    end
    @user_array = @user_array.sort do |a, b|
      a[4].nil? ? -1 : b[4].nil? ? 1 : a[4] <=> b[4]
    end
    @user_array = @user_array[0,5]
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
    @user.dollars = @user.dollars - price

    # re-assign users tool_id reference ID
    @user.tool_id = @tool.id

    #store to database
    @user.save

    #sends a confirmation back to store
    # I BELIEVE THESE ARE BROKEN?
    respond_to do |format|
      format.json { head :success }
    end

    # render :success
    # redirect_to action: "index"

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
