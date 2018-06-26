require 'rails_helper'
# require 'spec_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should create a product if all of validations is true' do
    @category = Category.new(name: "testing")
    @product = Product.new(name: "whatever" ,price_cents: 2200, quantity: 35, :category => @category)
    @product.valid?
    expect(@product.errors).not_to include("can't be blank")
    end

    it 'should not create a product if name is missing ' do
    @category = Category.new(name: "testing")
    @product = Product.new(price_cents: 2200, quantity: 2200, :category => @category)
    @product.valid?
    expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should not create a product if price is missing ' do
    @category = Category.new(name: "testing")
    @product = Product.new(name: "whatever", quantity: 2200, :category => @category)
    @product.valid?
    expect(@product.errors[:price]).to include("can't be blank")
    end

    it 'should not create a product if quantity is missing ' do
    @category = Category.new(name: "testing")
    @product = Product.new(name: "whatever", price_cents: 2200, :category => @category)
    @product.valid?
    expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not create a product if category is missing ' do
    @category = Category.new(name: "testing")
    @product = Product.new(name: "whatever", quantity: 2200, price_cents: 2200)
    @product.valid?
    expect(@product.errors[:category]).to include("can't be blank")
    end
  end
 end











