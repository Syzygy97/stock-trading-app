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

  def add_user
  end
  
  def create_user
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save && @user.update(status: 'approved')
      ApprovedAccountMailer.with(email: @user.email).approve_email.deliver_now
      flash[:notice] = 'Successfully created new trader account.'
      redirect_to admins_authenticated_root_path
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to admins_authenticated_root_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to admins_authenticated_root_path
  end
end