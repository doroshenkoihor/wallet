class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created."
      redirect_to spendings_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
