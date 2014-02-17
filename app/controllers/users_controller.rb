class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end		
  end	

  def index
  		@users=User.all
  end

  def edit
  end

  def delete
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end	
end
