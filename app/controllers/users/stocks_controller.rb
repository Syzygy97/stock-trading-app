class Users::StocksController < ApplicationController
  def index
    @client = IEX::Api::Client.new
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
end