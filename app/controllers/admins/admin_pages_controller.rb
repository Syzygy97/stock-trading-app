class Admins::AdminPagesController < ApplicationController
  def index
    @users = User.all
  end

  def approve_user
    @user = User.find_by(id: params[:id])
    @user.update(status: 1)
    if @user.save
      flash[:notice] = 'Successfuly approved trader registration.'
      ApprovedAccountMailer.with(email: @user.email).approve_email.deliver_now
      redirect_to admins_authenticated_root_path
    else
      flash[:error] = 'Failed to approve trader registration.'
      redirect_to admins_authenticated_root_path
    end
  end
end