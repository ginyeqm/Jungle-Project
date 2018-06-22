class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def email_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Order confirmation #{@order.id}')
  end
end
