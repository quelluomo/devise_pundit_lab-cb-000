class UsersController < ApplicationController

  def edit

  end

  def index
    if user_signed_in?
      @user = authorize User.find(current_user.id)
    end
  end

  def show
    if user_signed_in?
      @user = authorize User.find(current_user.id)
    else
      flash[:alert] = "Access denied."
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user unless !user_signed_in?
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end
