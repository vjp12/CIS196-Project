class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

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

def index
		@companies=User.all
	end

	def show
    	@company = User.find(params[:id])
	end

	def edit
		@company = User.find(params[:id])
	end

	def update
		respond_to do |format|
		  if @company.update(company_params)
		    format.html { redirect_to @company, notice: 'Post was successfully updated.' }
		  else
		    format.html { render action: 'edit' }
		  end
		end
	end	

	def delete
		@company.destroy
		respond_to do |format|
	  		format.html { redirect_to companies_url }
		end
	end

	def destroy
	@company.destroy
	respond_to do |format|
	  format.html { redirect_to companies_url }
	end
	end	

	private
	def set_company
      @compnay = User.find(params[:id])
    end

	def company_params
		params.require(:company).permit(:name, :email, :password)
	end	
end