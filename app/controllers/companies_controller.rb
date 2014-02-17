class CompaniesController < ApplicationController
  def new
  	@company = Company.new
  end

  def index
  	@companies = User,all
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end	
end