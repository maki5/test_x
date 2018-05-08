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

    ActionCable.server.broadcast 'users_channel', user: render_user(@user), user_edit: render_user_edit(@user), id: @user.id.to_s
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def render_user(user)
    ApplicationController.render(partial: 'users/user', locals: { user: user })
  end

  def render_user_edit(user)
    ApplicationController.render(partial: 'users/user_edit', locals: { user: user })
  end
end