class UsersController < ApplicationController
  before_action :set_user, only: %i[ update ]

  def index
    @users = current_user
  end

  def update
    if params[:commit] == "Deposit"
      result = current_user.balance.to_f + params[:user][:balance].to_f
    else
      result = current_user.balance.to_f - params[:user][:balance].to_f
    end

    if @user.update(balance: result)
      redirect_to dashboard_path
    end
  end

  private

  def set_user
    @user = User.where(id: current_user.id)
  end
end
