# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).per(10)
  end
end