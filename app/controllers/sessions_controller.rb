class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])

    if user
      log_in user
      flash[:notice] = 'Login successfully'
      redirect_to user_path(user)
    else
      flash.now[:notice] = 'Email does not exist'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
