
class UsersController < ApplicationController

before_action :user_params, only: [:create, :update]
before_action :find_user, only: [:destroy, :update, :show]

MY_SECRET = ENV['my_secret']

def index
   @users = User.all
   render json: UserSerializer.new(@users)
end

def show
   render json: UserSerializer.new(@user)
end

def create 
   @user = User.create!(user_params)
      if @user.valid?
         token = JWT.encode({user_id: @user.id}, MY_SECRET, 'HS256')
         render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
      else
         render json: { error: 'failed to create user'}, status: :not_acceptable
      end
end

def update
   @user.update(user_params)
   render json: UserSerializer.new(@user)
end

def destroy
   @user.destroy
end

private

def find_user
   @user = User.find(params[:id])
end

def user_params
   params.permit(:email, :password)
end

end
