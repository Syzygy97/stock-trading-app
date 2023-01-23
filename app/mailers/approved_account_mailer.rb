class ApprovedAccountMailer < ApplicationMailer
  def approve_email
    @email = params[:email]
    mail(to: @email, subject: '[Approved Account] Welcome to Stock Trading App')
  end
end
