class OrdersController < ApplicationController
  before_action :set_portfolio, only: %i[ index new create]
  before_action :set_stock, only: %i[ index new create]
  before_action :set_order, only: %i[ show edit update destroy ]
  # before_action :set_stock, only: %i[new create edit update destroy]
  # before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = @stock.orders
  end

  def show
  end

  def new
    @order = @stock.orders.new
    # @order = Order.new
  end

  def create
    @order = @stock.orders.new(order_params)
    
    debugger
    if @order.save
      # redirect_to portfolio_stock_orders_path, notice: "Order was successful."
      redirect_to portfolio_stock_path(portfolio.id, stock.id), notice: "Order was successful."
    else
      redirect_to new_portfolio_stock_order_path(@portfolio, @stock), alert: "Order was unsuccessful."
      
    end
    # @order = Order.new(order_params)
    # @order[:stock_id] = @stock.id
    # @order_quantity_copy = @order.quantity

    # if @order.save
    #   flash.notice = 'Order was successful.'
    #   # flash.notice = 'Order was successfully executed.' if @order.quantity != @order_quantity_copy
    #   redirect_to stock_orders_path
    # else
    #   flash.alert = 'Order was unsuccessful.'
    #   redirect_to new_stock_order_path(@stock)
    # end
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
    @stock = @portfolio.stocks.find(params[:stock_id])
  end

  def set_order
    set_stock
    @order = @stock.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_type, :price, :quantity)
  end
end
