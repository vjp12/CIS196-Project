class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # place an order for an investment
  def order
    portfolio = current_member.portfolio
    new_order = BigDecimal(params[:dollar] + "." + params[:decimal])
    new_funds = BigDecimal(portfolio.funds_remaining) + new_order
    portfolio.funds_remaining = new_funds.to_s
    # portfolio.funds_remaining = reset
    respond_to do |format|
      if portfolio.save
        format.html { redirect_to investments_path, notice: 'The investment was successfully added.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def reset
    "1000000"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:funds_remaining, :market_value, :member_id, :investments, :stocks)
    end
end
