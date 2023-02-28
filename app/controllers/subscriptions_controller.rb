class SubscriptionsController < ApplicationController
  def create
    sub = Subscription.new(subscription_params)
    
    if sub.save
      render json: SubscriptionSerializer.new(sub), status: 201
    else
      render json: ErrorSerializer.record_not_created, status: 400
    end
  end

  def edit 
    sub = Subscription.find_by(id: params[:id])
    
    if sub 
      sub.update(status: 1)

      render status: 204
    else 
      render json: ErrorSerializer.record_not_found(params[:id]), status: 400
    end
  end

  private

  def subscription_params
    params.permit(:frequency, :customer_id, :tea_id)
  end
end