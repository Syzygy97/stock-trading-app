class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]
  before_action :set_client, only: %i[ index show edit update destroy ]
  before_action :authenticate_user!

  def index
    @stocks = Stock.all
    ten_most_active_stocks = @client.stock_market_list(:mostactive, listLimit: 100)
    ten_most_active_symbols = ten_most_active_stocks.map(&:symbol)
    ten_most_active_symbols.each do |symbol|
      # debugger
      @stock = @stocks.find_by(symbol: symbol)
      if !(@stocks.count > 0) || !@stocks.map(&:symbol).any?(symbol)
        @stock = @stocks.create(
          :company_name => @client.company(symbol).company_name,
          :symbol => symbol,
          :logo => @client.logo(symbol).url,
          :price => ten_most_active_stocks.select{|item| item.symbol == symbol}.last.latest_price,
          :quantity => ten_most_active_stocks.select{|item| item.symbol == symbol}.last.iex_volume,
          :change => ten_most_active_stocks.select{|item| item.symbol == symbol}.last.change,
          :percent_change => ten_most_active_stocks.select{|item| item.symbol == symbol}.last.change_percent_s
        )
      else
        @stock.update_existing_stock_price
      end
    end
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