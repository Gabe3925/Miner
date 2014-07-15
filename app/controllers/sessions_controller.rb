class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user by email:
    user = User.find_by(name: params[:session][:name].downcase)

    # Test if the user was found AND authenticates
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash[:error] = 'Incorrect name or password.'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
