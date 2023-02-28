require 'rails_helper'

RSpec.describe 'create subscription', type: :request do 
  describe 'successful request' do 
    it 'creates a subscription in the database' do
      customer = create(:customer)
      tea = create(:tea)
      
      subscription_params = {
        title: "My First Subscription",
        frequency: 4,
        customer_id: customer.id,
        tea_id: tea.id
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/subscriptions', headers: headers, params: subscription_params.to_json
    end
  end
end