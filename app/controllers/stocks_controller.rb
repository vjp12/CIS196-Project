class StocksController < ApplicationController
  before_filter :authenticate_member!
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all 
 
    @stocks.each  do |x|
      x.price = StockQuote::Stock.quote(x.ticker).last_trade_price_only
      x.save
    end 
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @net_investment = 0
    @stock = Stock.find(params[:id])
    @investments = Investment.where(stock_id: @stock.id).limit(10)
    @my_investments = Investment.where(stock_id: @stock.id, member_id: current_member.id)
    @my_investments.each do |investment|
      @net_investment += investment.share_change
    end  
    @stock.price = StockQuote::Stock.quote(@stock.ticker).last_trade_price_only
    @stock.save
    require 'net/http'

    begin
      @url = 'http://chart.finance.yahoo.com/z?s=%{ticker}' % {ticker: @stock.ticker}
      @resp = Net::HTTP.get_response(URI.parse(@url)) # get_response takes an URI object
    rescue
      print "Connection error."
    end   
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
      @stock.ticker = @stock.ticker.upcase
      @stock.save
      @testStockTicker = StockQuote::Stock.quote(@stock.ticker)
      if @testStockTicker.failure?
        @stock.destroy
        respond_to do |format|
          format.html { redirect_to new_stock_path, notice: 'Invalid ticker. Please try again.' }
        end
      else
        response = Net::HTTP.get_response("d.yimg.com", "/autoc.finance.yahoo.com/autoc?query=" + @stock.ticker + "&callback=YAHOO.Finance.SymbolSuggest.ssCallback")
        stockHash = response.body[39...-1]
        Rails.logger.debug("debug::     STOCKHASH : " + stockHash)
        parsed = JSON.parse(stockHash)
        @stock.name = parsed["ResultSet"]["Result"][0]["name"]
        respond_to do |format|
          if @stock.save
            format.html { redirect_to @stock, notice: 'Stock was successfully added.' }
          else
            format.html { render action: 'new' }
            format.json { render json: @stock.errors, status: :unprocessable_entity }
          end
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
    redirect_to delete_stock_investments_path(@stock.id)
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

  def refresh_stocks
    @stocks = Stock.all 
 
    @stocks.each  do |x|
      x.price = StockQuote::Stock.quote(x.ticker).last_trade_price_only
      x.save
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.fetch(:stock,{}).permit(:ticker, :name, :price)
    end
end
