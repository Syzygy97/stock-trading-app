class User < ApplicationRecord
  after_create :send_welcome_email
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :status, { pending: 0, approved: 1 }, default: :pending

  private

  def send_welcome_email
    WelcomeMailer.with(email: email).welcome_email.deliver_now
  end
end
