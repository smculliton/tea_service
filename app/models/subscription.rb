class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  enum status: [ :active, :cancelled ]

  after_create :generate_attributes

  def generate_attributes
    update(price: calculate_price)
    update(title: create_title) unless title
  end

  def calculate_price
    Tea.find(tea_id).unit_price / ( frequency.to_f / 4 )
  end

  def create_title
    "#{Customer.find(customer_id).first_name}'s #{Tea.find(tea_id).title} Subscription"
  end
end
