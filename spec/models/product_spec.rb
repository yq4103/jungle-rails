require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'will save' do
      @product = Product.new
      @category = Category.new
      @product.name = 'name'
      @product.price_cents = 5000
      @product.quantity = 4
      @product.category = @category

      expect(@product.valid?).to be true
    end
    it 'should have a name' do 
      @product = Product.new

      @product.name = nil
      @product.valid?

      expect(@product.errors[:name]).to include("can't be blank")
    end
    it 'should have a price' do
      @product = Product.new

      @product.price_cents = nil
      @product.valid?

      expect(@product.errors[:price_cents]).to include("is not a number")
    end
    it 'should have a quantity' do
      @product = Product.new

      @product.quantity = nil
      @product.valid?

      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it 'should have a category' do
      @product = Product.new

      @product.category = nil
      @product.valid?

      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end