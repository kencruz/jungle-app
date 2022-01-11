require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      @category = Category.new(:name => "Computer Accessories")
      @category.save
      @category.products.create!({name: "Monitor", price: 199.99, quantity: 10})
      expect(@category.products.count).to be(1)
    end

  end
end

