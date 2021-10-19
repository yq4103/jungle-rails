require 'rails_helper'

# it 'is valid with valid attributes' do       @category = Category.new(name: 'Test')       @product = Product.new(name: 'Test', price: 10, quantity: 2, category: @category)       expect(@category).to be_valid       expect(@product).to be_valid
  
#   it 'is not valid without a name' do       @category = Category.new(name: 'Test')       @product = Product.new(name: nil, price: 10, quantity: 2,category: @category)       expect(@product).to_not be_valid     end

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'a user is valid if password and password confirmation match' do
      @user = User.new(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.COM',
        password: '123abc',
        password_confirmation: '123abc'
        )
      expect(@user).to be_valid
    end
    it 'a user is not valid if password and password confirmation do not match' do
      @user = User.new(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.COM',
        password: 'abc123',
        password_confirmation: 'abc456'
        )
      expect(@user).to_not be_valid
    end
    it 'email must be unique' do
      User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.COM',
        password: 'abc123',
        password_confirmation: 'abc123'
      )
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.COM',
        password: 'abc123',
        password_confirmation: 'abc123'
      )
      expect(@user).to_not be_valid
    end
    it 'should have an email' do 
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: nil,
        password: 'abc123',
        password_confirmation: 'abc123'
      )
      expect(@user.errors[:email]).to include("can't be blank")
    end
    it 'should have a first name' do 
      @user = User.create(
        first_name: nil,
        last_name: 'last name',
        email: 'test@test.COM',
        password: 'abc123',
        password_confirmation: 'abc123'
      )
      expect(@user.errors[:first_name]).to include("can't be blank")
    end
    it 'should have a last name' do 
      @user = User.create(
        first_name: 'first name',
        last_name: nil,
        email: 'test@test.COM',
        password: 'abc123',
        password_confirmation: 'abc123'
      )
      expect(@user.errors[:last_name]).to include("can't be blank")
    end
    it 'must have minimum length' do
      @user = User.new(password: '123')
      expect(@user.password.length).to be(3)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'a user is valid if password and password confirmation match' do
      @user = User.new(
        first_name: 'first name',
        last_name: 'last name',
        email: 'test@test.com',
        password: '123abc',
        password_confirmation: '123abc'
        )

        user = User.authenticate_with_credentials(' test@test.COM ', '123abc')
      expect(@user).to be_valid
    end
  end

end
