class InvestmentsController < ApplicationController
  before_filter :authenticate_member!
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    if member_signed_in? 
      @investments = Investment.all
    else
      @investments = []
    end  
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
    @investment = Investment.find(params[:id])
  end

  # GET /investments/new
  def new
    @investment = Investment.new
  end

  # GET /investments/1/edit
  def edit
    @investment = Investment.find(params[:id])
  end

  # POST /investments
  # POST /investments.json
  def create
    if member_signed_in? 
      @investment = Investment.new(investment_params)
    
      respond_to do |format|
        if @investment.save
          format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @investment }
        else
          format.html { render action: 'new' }
          format.json { render json: @investment.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_member_session_path
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to investments_url }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.fetch(:investment,{}).permit(:member_id, :stock_id, :share_change)
    end
end
