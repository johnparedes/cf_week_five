class UsersController < ApplicationController

before_action :find_user, only: %w(edit update show)

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new users_params
    if @user.save
      flash.notice = "You successfully created a new user."
      redirect_to "/"
    else
     render "new"
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash.notice = "Successfully updated user record."
      redirect_to "/"
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "You have successfully deleted the user."
    redirect_to "/"
  end

  def show
  end

  private

  def find_user
    @users = User.find(params[:id])
  end

  def users_params
    params.require(:first_name).require(:last_name).permit(:phone, :email)
  end

end
