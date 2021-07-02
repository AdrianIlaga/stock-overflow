class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @account_type = @user.user_type.user_type
    return unless %w[buyer broker].include?(@account_type)

    mail(to: @user.email, subject: 'Welcome to Stock Overflow')
  end

  def approval_email(user)
    @user = user
    mail(to: @user.email, subject: 'Broker Account Approval')
  end
end
