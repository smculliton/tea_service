require 'rails_helper' 

RSpec.describe 'fetch all of one customers subscriptions', type: :request do
  describe 'successful request' do
    it 'returns all subscriptions made by customer' do 
      customer = create(:customer)
      teas = create_list(:tea, 4)
      teas.each do |tea|
        Subscription.create(frequency: 4, tea_id: tea.id, customer_id: customer.id)
      end

      headers = {"CONTENT_TYPE" => "application/json"}

      get "/subscriptions", headers: headers, params: { id: customer.id }

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(200)
    
      expect(data).to be_a Array
      expect(data.length).to eq(4)
      data.each do |sub|
        expect(sub).to have_key(:id)
        expect(sub).to have_key(:type)
        expect(sub).to have_key(:attributes)
        expect(sub[:attributes]).to have_key(:title)
        expect(sub[:attributes]).to have_key(:price)
        expect(sub[:attributes]).to have_key(:status)
        expect(sub[:attributes]).to have_key(:frequency)
        expect(sub[:attributes]).to have_key(:customer_id)
        expect(sub[:attributes]).to have_key(:tea_id)
      end
    end
  end

  describe 'unsuccessful requests' do 
    describe 'bad customer id given' do 
      it 'returns an error message' do 
        headers = {"CONTENT_TYPE" => "application/json"}

        get "/subscriptions", headers: headers, params: { id: "fake_id" }

        err = JSON.parse(response.body, symbolize_names: true)[:errors]

        expect(response.status).to eq(400)
        expect(err[:title]).to eq('NONEXISTENT RECORD')
        expect(err[:detail]).to eq("Unable to find record with given id 'fake_id'")
      end
    end
  end
end