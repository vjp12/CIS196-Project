class PagesController < ApplicationController
  def index
    ##redirect_to refresh_stocks_path

  	@members = Member.all.order(:value)
  	@i = 1
  end
end
