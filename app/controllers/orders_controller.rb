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
    @stock = Stock.find_by(symbol: order_params[:symbol])
    @order = Order.new(order_params)
    # @order.user_balance_sufficient?
    
    # @order.recalculate_user_balance
    # debugger
    # if order_params[:order_type] == "BUY"
    # else

    # end
    # debugger
    if @order.save
      # @order.order_type == "BUY" ? price = -@order.price : price = @order.price
      if @order.order_type == "BUY"
        order_price = -@order.price
        order_quantity = -@order.quantity
        @trader_stock = TraderStock.create(
          :user_id => order_params[:user_id].to_i,
          :symbol => order_params[:symbol],
          :price => order_params[:price].to_i,
          :quantity => order_params[:quantity].to_i
        )
      else
        order_price = @order.price
        order_quantity = @order.quantity
      end 
      current_user.recalculate_balance order_price
      @stock.update_stock_quantity order_quantity
      # debugger
      
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
    # @stock = Stock.where(symbol: params[:symbol])
    @stock = Stock.find_by(symbol: params[:symbol])
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
