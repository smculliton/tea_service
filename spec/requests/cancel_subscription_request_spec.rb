require 'rails_helper'

RSpec.describe 'cancel subscription', type: :request do 
  describe 'successful request' do 
    it 'changes status of subscription to cancelled' do 
      customer = create(:customer)
      tea = create(:tea)
      sub = Subscription.create!(frequency: 4, tea_id: tea.id, customer_id: customer.id)

      headers = {"CONTENT_TYPE" => "application/json"}

      patch '/subscriptions', headers: headers, params: { id: sub.id }.to_json

      expect(response.status).to eq(204)
      
      expect(Subscription.find(sub.id).status).to eq('cancelled')
    end
  end

  describe 'unsuccessful request' do 
    describe 'bad id number passed' do 
      it 'returns error message' do 
        customer = create(:customer)
        tea = create(:tea)
        sub = Subscription.create!(frequency: 4, tea_id: tea.id, customer_id: customer.id)
        id = sub.id - 1

        headers = {"CONTENT_TYPE" => "application/json"}

        patch '/subscriptions', headers: headers, params: { id: id }.to_json

        err = JSON.parse(response.body, symbolize_names: true)[:errors]

        expect(response.status).to eq(400)
        expect(err[:title]).to eq('NONEXISTENT RECORD')
        expect(err[:detail]).to eq("Unable to find record with given id '#{id}'")
      end
    end
  end
end