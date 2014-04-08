class StocksController < ApplicationController
  before_filter :authenticate_member!
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all 
 
    @stocks.each  do |x|
      @price = StockQuote::Stock.quote(x.ticker).last_trade_price_only
      @name = StockQuote::Stock.quote(x.ticker).name
      x.name = @name
      x.price = @price
      x.update(stock_params)
    end  
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    @investments = Investment.where(stock_id: @stock.id).limit(10)
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
    redirect_to delete_stock_investments(@stock_id)
    @stock.destroy
  end

  def increment_stock
    @stock = Stock.find(params[:id])
    @stock.investors += 1
    @stock.update(stock_params) 
     respond_to do |format|
        format.html { redirect_to Investment.find(params[:i_id]), notice: 'Investment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @investment }
     end     
  end

  def deincrement_stock
    @stock = Stock.find(params[:id])
    @stock.investors -= 1
    @stock.update(stock_params) 
     respond_to do |format|
      format.html { redirect_to investments_url }
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
