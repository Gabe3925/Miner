class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user by email:
    user = User.find_by(email: params[:session][:email].downcase)

    # Test if the user was found AND authenticates
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
    else
      flash[:error] = 'Invalid email/password'
      redirect_to new_session_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
