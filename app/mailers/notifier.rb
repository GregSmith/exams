class Notifier < ActionMailer::Base
  default :from => 'Sam Ruby <exams@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => 'Order Confirmation'
    end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    
    mail :to => order.email, :subject => 'Shipping Confirmation'
  end
end
