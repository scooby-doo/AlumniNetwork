# User controller
class UsersController < ApplicationController
  # Finds a user by id
  def show
    @user = User.find(params[:id])
  end

  # Edit ation
  def edit
    @user = User.find(params[:id])
  end

  # Updates a user
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  # Needed params for operations
  def user_params
    params.require(:user).permit!
  end
end
