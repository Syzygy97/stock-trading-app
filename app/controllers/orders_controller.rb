class OrdersController < ApplicationController
  before_action :set_stock, only: %i[new create edit update destroy]
  before_action :set_order, only: %i[edit update destroy]
  
  def index
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
      @stock = Stock.find(params[:stock_id])
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_type, :price, :quantity)
    end
end
