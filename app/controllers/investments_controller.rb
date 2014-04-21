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
  end

  # GET /investments/new
  def new
    @investment = Investment.new
    @stocks = Stock.all
  end   

  # GET /investments/1/edit
  def edit
    @investment = Investment.find(params[:id])
  end

  # POST /investments
  # POST /investments.json
  def create
    @stocks = Stock.all
    if member_signed_in? 
      @investment = Investment.new(investment_params)
    
      if @investment.save
        @stock_id = @investment.stock_id
        redirect_to increment_stock_path(@stock_id, @investment.id)
      else
        respond_to do |format|
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
    @stock_id = @investment.stock_id

    @investment.destroy
    redirect_to deincrement_stock_path(@stock_id, @investment.id)
  end

  def delete_stock_investments
    @stocks = Investment.find(params[:id])
    @stocks.each  do |x|
      x.destroy
    end  
    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end  
  end    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.fetch(:investment,{}).permit(:member_id, :stock_id, :share_change)
    end
end
