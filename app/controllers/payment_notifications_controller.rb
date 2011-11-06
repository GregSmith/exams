class PaymentNotificationsController < ApplicationController

  protect_from_forgery :except => [:create]
  def create
    PaymentNotification.create!(:params => params,
                                :cart_id => params[:invoice],
                                :status => "Completed",
                                :transaction_id => params[:txn_id])
  render :nothing => true
  end
end

