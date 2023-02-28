require 'rails_helper'

RSpec.describe Subscription, type: :model do 
  describe 'relationships' do 
    it { should belong_to :customer }
    it { should belong_to :tea }
  end

  describe 'upon creation' do 
    before(:each) do 
      @customer = create(:customer, first_name: 'Sean')
      @tea = create(:tea, title: 'Lipton', unit_price: 50)
      @subscription = Subscription.create!(
        frequency: 2,
        customer_id: @customer.id,
        tea_id: @tea.id
      )
    end
    it 'automatically generates price, status' do 
      expect(@subscription.status).to eq('active')
      expect(@subscription.price).to_not eq(nil)
    end

    it 'automatically generates title if not provided' do 
      expect(@subscription.title).to eq("Sean's Lipton Subscription")
    end

    it 'doesnt generate title if already provided' do 
      sub = Subscription.create!(
        frequency: 2,
        customer_id: @customer.id,
        tea_id: @tea.id,
        title: 'Tea is Fun'
      )

      expect(sub.title).to eq('Tea is Fun')
    end

    it 'calculates price based on tea cost and frequency' do 
      sub = Subscription.create!(
        frequency: 4,
        customer_id: @customer.id,
        tea_id: @tea.id,
      )

      expect(@subscription.price).to eq(100.0)
      expect(sub.price).to eq(50.0)
    end
  end
end