class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

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

	def show
    	@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		respond_to do |format|
		  if @user.update(user_params)
		    format.html { redirect_to @user, notice: 'Post was successfully updated.' }
		  else
		    format.html { render action: 'edit' }
		  end
		end
	end	

	def delete
		@user.destroy
		respond_to do |format|
	  		format.html { redirect_to users_url }
		end
	end

	def destroy
	@user.destroy
	respond_to do |format|
	  format.html { redirect_to users_url }
	end
	end	

	private
	def set_user
      @user = User.find(params[:id])
    end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end	
end
