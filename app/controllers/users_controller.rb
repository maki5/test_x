# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end