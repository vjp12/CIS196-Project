class PagesController < ApplicationController
  def index
    ##redirect_to refresh_stocks_path

    portfolios = Portfolio.all   
	  portfolios.each do |portfolio|
	   value = BigDecimal("0")
      investments = Investment.where(member_id: portfolio.member.id)
      investments.each  do |investment|
        stock_id = investment.stock_id
        stock = Stock.where(stock_id).first
        price = StockQuote::Stock.quote(stock.ticker).last_trade_price_only
        value += BigDecimal(investment.share_change.to_s) * price
      end
      portfolio.market_value = value.to_s
      portfolio.save
    end
  	@members = portfolios.order('market_value DESC')
  	@i = 1
  end
end
