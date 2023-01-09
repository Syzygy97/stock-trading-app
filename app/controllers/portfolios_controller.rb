class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
