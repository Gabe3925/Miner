require 'pry'
class MinesController < ApplicationController
before_action :find_mine, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.find(params[:user_id])
    # @mine = @user.mines.new
    @mine = Mine.new
  end

  def create
    @user = User.find(params[:user_id])
    @mine = @user.mines.build(mine_params)
    if @mine.save
      redirect_to user_mine_path(@user, @mine)
    else
      render new_user_mine_path(@user)
    end
  end

  # THIS IS THE GAME PORTION:
  def show
    @user = User.find(params[:user_id])
    @mine = @user.mines.first
    @tool = Tool.find(@user.tool_id)
    @curr_tool_name = @tool.name
  end

  def edit
  end

  def update
    @mine.update(mine_params)
    redirect_to @mine
  end

  def update_depth #Updates mine depth as a user mines...

    user = User.find(params[:user_id])
    @mine = user.mines.first
    new_depth = params[:updatedDepth]

    #store to database
    @mine.depth = new_depth
    @mine.save

  end

  def destroy
  end


  private

  def find_mine
    @mine = Mine.find(params[:id])
  end

  def mine_params
    params.require(:mine).permit(:name)
  end

end
