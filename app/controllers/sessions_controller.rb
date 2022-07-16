class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user&.authenticate(params[:password])
      sign_in user
      flash[:notice] = "Logged in successfully."
      redirect_to spendings_path
    else
      flash.now[:alert] = "There was something wrong with your login details."
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
