class StocksController < ApplicationController
  before_filter :authenticate_member!
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    @investments = Investment.where(stock_id: @stock.id)
    @my_investments = Investment.where(stock_id: @stock.id, member_id: current_member.id)

    @stock.name= StockQuote::Stock.quote(@stock.ticker).name
    @stock.price = StockQuote::Stock.quote(@stock.ticker).last_trade_price_only
    @stock.update(stock_params)
  end

  # GET /stocks/new
  def new
    @stock = Stock.new 
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    if member_signed_in? 
      @stock = Stock.new(stock_params)

      respond_to do |format|
        if @stock.save
          format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
          format.json { render action: 'show', status: :created, location: @stock }
        else
          format.html { render action: 'new' }
          format.json { render json: @stock.errors, status: :unprocessable_entity }
        end
      end    
    else
      redirect_to new_member_session_path
    end   
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.fetch(:stock,{}).permit(:ticker, :name, :price, :market_value, :investors)
    end
end
