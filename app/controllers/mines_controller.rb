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
  end

  def edit
  end

  def update
    @mine.update(mine_params)
    redirect_to @mine
  end

  def update_mine_depth #UPON EXITING GRAPHIC GAMEPLAY...
    #find user
    @user = User.find(params[:id])
    #find mine based on user
    @mine = @user.mines.first
    #get new depth from params
    @new_depth = params[:depth]
    #store to database
    @mine.depth == @new_depth
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
