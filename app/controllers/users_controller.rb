class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]
  before_action :find_user, only: [:show, :edit, :destroy]
  before_action :require_current_user, except: [:index, :new, :create]

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
    # @user = User.find(params[:id])
    # @user = User.find(params[:user_id])
    @mine = @user.mines.first
    @tool = Tool.find(@user.tool_id)
  end

  def edit
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    new_dollars = params[:dollars]
    #store to database
    @user.dollars<<new_dollars
  end

  def update_tool

    # Finds the user...
    user = User.find(params[:id])
    #Finds the tool by the id that was sent along in the request...
    tool = Tool.find(tool_to_buy)

      if user.dollars > tool.price
        #Deducts this tools cost from users dollars,
        user.dollars = user.dollars - tool.price
        #then sets users tool_id to ref this .
        user.tool_id == tool.id
      else
        redirect_to 'store', :flash => { :failure => "You lack sufficient funds!" }
      end

    redirect_to 'store'
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
