class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user, except: [:index, :new, :create]



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

  def show
    @user = User.find(params[:id])
    @mine = @user.mines.first
    @tool = @user.tools.first
  end

  def edit
  end

  def store
    render 'store'
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
