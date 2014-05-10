class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable

  has_one :portfolio
  has_many :investments, :through => :portfolio

  after_create :create_portfolio
  def create_portfolio
    portfolio = Portfolio.new
    portfolio.member = self
    portfolio.funds_remaining = BigDecimal("100000").to_s
    portfolio.market_value = BigDecimal("0").to_s
    if portfolio.save
      Rails.logger.debug("debug:== Portfolio saved: #{portfolio}")
    else
      Rails.logger.debug("debug:== Portfolio cannot be created!")
    end
  end
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true 
  validates :password, length: {minimum: 8}
  validates :password, confirmation: true        
end
