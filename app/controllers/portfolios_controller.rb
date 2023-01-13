class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]

  def index
    @portfolios = Portfolio.all
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:commit] == "Deposit"
      result = @portfolio.balance.to_f + portfolio_params[:balance].to_f
    else
      result = @portfolio.balance.to_f - portfolio_params[:balance].to_f
    end

    if @portfolio.update(balance: result)
      redirect_to portfolios_path
    end
  end

  def destroy
  end
  
  private

    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:balance)
    end

end
