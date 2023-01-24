class ApprovedAccountMailer < ApplicationMailer
  def approve_email
    @email = params[:email]
    mail(to: @email, subject: '[ACCOUNT APPROVED] Welcome to ASTR!')
  end
end
