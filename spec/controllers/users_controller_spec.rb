require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    it "assigns @users" do
      user = User.create
      get :index
      expect(assigns(:users).to_a).to eq([user])
    end

    it "respond with 200" do
      get :index
      expect(response).to have_http_status 200
    end
  end


  describe "POST create" do
    it 'creates a new user' do
      user_params = {user: {first_name: "test_first_name", last_name: "test_last_name"}}
      post :create, params: user_params

      expect(assigns(:user).first_name).to eq(user_params[:user][:first_name])
      expect(assigns(:user).last_name).to eq(user_params[:user][:last_name])
    end

    it 'redirect to user path' do
      user_params = {user: {first_name: "test_first_name", last_name: "test_last_name"}}
      post :create, params: user_params

      expect(response).to redirect_to users_path
    end
  end


  describe "PATCH update" do
    it 'should update user data' do
      user = User.create

      patch :update, params: {id: user.id, user: {first_name: "test_first_name", last_name: "test_last_name"}}

      expect(assigns(:user).first_name).to eq("test_first_name")
      expect(assigns(:user).last_name).to eq("test_last_name")
    end
  end
end
