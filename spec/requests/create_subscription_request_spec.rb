require 'rails_helper'

RSpec.describe 'create subscription', type: :request do 
  describe 'successful request' do 
    it 'creates a subscription in the database' do
      customer = create(:customer)
      tea = create(:tea)
      num_subs = Subscription.all.length

      subscription_params = {
        frequency: 4,
        customer_id: customer.id,
        tea_id: tea.id
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/subscriptions', headers: headers, params: subscription_params.to_json

      data = JSON.parse(response.body, symbolize_names: true)[:data]
      attrs = data[:attributes]

      expect(num_subs + 1).to eq(Subscription.all.length)
      expect(response.status).to eq(201)

      expect(data).to be_a Hash

      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(attrs).to have_key(:title)
      expect(attrs).to have_key(:price)
      expect(attrs).to have_key(:status)
      expect(attrs).to have_key(:frequency)
      expect(attrs).to have_key(:customer_id)
      expect(attrs).to have_key(:tea_id)
    end
  end

  describe 'unsuccessful request' do 
    describe 'params not provided' do 
      it 'returns error message' do 
        num_subs = Subscription.all.length

        headers = {"CONTENT_TYPE" => "application/json"}

        post '/subscriptions', headers: headers

        err = JSON.parse(response.body, symbolize_names: true)[:errors]

        expect(num_subs).to eq(Subscription.all.length)
        expect(response.status).to eq(400)
        
        expect(err).to be_a Hash
        expect(err).to have_key(:status)
        expect(err[:status]).to eq(400)
        expect(err).to have_key(:title)
        expect(err).to have_key(:detail)
      end
    end
  end
end