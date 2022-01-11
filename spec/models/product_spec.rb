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

    it "is not valid without a name" do
      @category = Category.new(:name => "Computer Accessories")
      @category.save


      @product = Product.new
      @product.category = @category
      @product.price = 199.99
      @product.quantity = 10

      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new(:name => "Computer Accessories")
      @category.save


      @product = Product.new
      @product.category = @category
      @product.name = "Mouse"
      @product.quantity = 10

      expect(@product).to_not be_valid
    end

  end
end

