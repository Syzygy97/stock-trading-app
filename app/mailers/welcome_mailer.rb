class WelcomeMailer < ApplicationMailer
  def welcome_email
    @email = params[:email]
    mail(to: @email, subject: 'Welcome to ASTR!')
  end
end
