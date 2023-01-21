class OrdersController < ApplicationController
  before_action :set_stock, only: %i[ index new create edit destroy]
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @stocks = Stock.all
    @orders = Order.all
  end

  def new
    @order = Order.new
    # debugger
  end

  def create
    @order = Order.new(order_params)
    # debugger
    # @order.compute_total_order_price

    # if order_params[:order_type] == "BUY"

    # else

    # end
    if @order.save
      redirect_to orders_path, notice: "Order was successful."
    else
      redirect_to new_order_path(user_id: current_user.id, symbol: @stock.symbol), alert: "Order was unsuccessful."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_stock
    @stock = Stock.where(symbol: params[:symbol])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_type, :price, :quantity, :symbol, :user_id)
  end

  def transact_order
    
  end

end
