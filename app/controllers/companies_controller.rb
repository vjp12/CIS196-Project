class CompaniesController < ApplicationController
  def new
  	@company = Company.new
  end

  def index
  	@companies = Company.all
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
  		redirect_to companies_path
  	else
  		render 'new'
  	end		
  end	

  private

  def user_params
  	params.require(:company).permit(:name, :email, :password)
  end	
end