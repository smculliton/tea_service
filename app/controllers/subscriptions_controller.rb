class SubscriptionsController < ApplicationController
  def create
    sub = Subscription.new(subscription_params)
    
    if sub.save
      render json: SubscriptionSerializer.new(sub), status: 201
    else
      render json: ErrorSerializer.record_not_created, status: 400
    end
  end

  private

  def subscription_params
    params.permit(:frequency, :customer_id, :tea_id)
  end
end