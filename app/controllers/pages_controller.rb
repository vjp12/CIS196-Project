class PagesController < ApplicationController
  def index
  	@members = Member.all.order(:value)
  	@i = 0
  end
end
