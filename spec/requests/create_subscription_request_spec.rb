require 'rails_helper'

RSpec.describe 'create subscription', type: :request do 
  describe 'successful request' do 
    it 'creates a subscription in the database' do
      customer = create(:customer)
      tea = create(:tea)
      require 'pry'; binding.pry
    end
  end
end