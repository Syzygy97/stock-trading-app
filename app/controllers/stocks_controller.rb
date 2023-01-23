class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]
  before_action :set_client, only: %i[ index show edit update destroy ]

  def index
    @stocks = Stock.all
    examples = ["BBBY", "TSLA", "AMZN", "AAPL", "BIOR", "AMC", "F", "LCID", "AMD", "MARA"]
    # ten_most_active_quote = @client.stock_market_list(:mostactive)
    # ten_most_active_symbol = ten_most_active_quote.map(&:symbol)
    # examples.each do |symbol|
    #   # debugger
    #   @stock = @stocks.find_by(symbol: symbol)
    #   if @stocks.map(&:symbol).any?(symbol)
    #     @stock.update_existing_stock_price
    #   else
    #     @stock = @stocks.create(
    #         :company_name => @client.company(symbol).company_name,
    #         :symbol => symbol,
    #         :logo => @client.logo(symbol).url,
    #         :price => rand(1.0..1_000.0).round(2),
    #         :quantity => rand(100..10_000)
    #       )
    #   end
    # end
  end

  def show
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

    def set_stock
      @stock = Stock.find(params[:id])
    end

    def set_client
      @client = IEX::Api::Client.new
    end

    def stock_params
      params.require(:stock).permit(:company_name, :symbol, :logo, :price, :quantity)
    end

end