class StocksController < ApplicationController
  before_action :set_portfolio, only: %i[ index new create show]
  before_action :set_stock, only: %i[ show edit update destroy ] 
  
  def index
    @client = IEX::Api::Client.new
    @stocks = @portfolio.stocks
    ten_most_active = @client.stock_market_list(:mostactive).map(&:symbol)
    # ten_most_active_fixed = ["BBBY", "TSLA", "AMZN", "AAPL", "BIOR", "AMC", "F", "LCID", "AMD", "MARA"]
    # ten_most_active.each do |symbol|
    #   # PUT AN IF STATEMENT THAT MAKES QUERYING OF ALREADY EXISTING DATA IN DATABASE NOT ALLOWED
    #   # if symbol
    #   @stock = @stocks.create(
    #     :company_name => @client.company(symbol).company_name,
    #     :symbol => symbol,
    #     :logo => @client.logo(symbol).url,
    #     :price => rand(1.0..1_000.0).round(2),
    #     :quantity => rand(100..10_000)
    #   )
    # end
  end

  def show
    @client = IEX::Api::Client.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:portfolio_id])
    end

    def set_stock
      set_portfolio
      @stock = @portfolio.stocks.find(params[:id])
    end

    def stock_params
      params.require(:stock).permit(:company_name, :symbol, :logo, :price, :quantity)
    end

end