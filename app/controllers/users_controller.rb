class UsersController < ApplicationController

before_action :find_user, only: %w(edit update show)

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @users = User.new users_params
    if @users.save
      flash[:notice] = "You successfully created a new user."
      redirect_to @users
    else
     render "new"
    end
  end

  def edit
  end

  def update
    if @user.update users_params
      flash[:notice] = "Successfully updated user record."
      redirect_to users_url
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "You have successfully deleted the user."
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end

end
