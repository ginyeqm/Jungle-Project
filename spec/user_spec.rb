require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it 'should create a user if all of the validations are true' do
    @user = User.new(first_name: "chris", last_name: "kim", email: "aa@gmail.com" , password: "aabbcc" , password_confirmation: "aabbcc")
    @user.valid?
    expect(@user.errors).not_to include ("can't be blank")
    end

    it 'should not create a user if their first name is missing' do
    @user = User.new( email: "aa@gmail.com" , password: "aabbcc" , password_confirmation: "aabbcc")
    @user.valid?
    expect(@user.errors[:first_name]).to include ("can't be blank")
    end

    it 'should not create a user if their last name is missing' do
    @user = User.new(first_name: "chris", email: "aa@gmail.com" , password: "aabbcc" , password_confirmation: "aabbcc")
    @user.valid?
    expect(@user.errors[:last_name]).to include ("can't be blank")
    end

    it 'should not create a user if their email is missing' do
    @user = User.new(first_name: "chris",last_name:"kim", password: "aabbcc" , password_confirmation: "aabbcc")
    @user.valid?
    expect(@user.errors[:email]).to include ("can't be blank")
    end

    # it 'should not create a user if email is not unique' do
    # @user1 = User.new(first_name: "chris", last_name:"kim" , email: "aa@gmail.com" , password: "aabbcc" , password_confirmation: "aabbcc")
    # @user1.save
    # @user2 =  User.new(first_name: "chris",last_name:"kim" , email: "AA@gmail.com" , password: "aabbcc" , password_confirmation: "aabbcc")
    # @user2.valid?
    # expect(@user2.errors[:email]).to include ("email already exist")
    # end




  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end





# it 'should not create a User if their passwords do not match' do
#     @user = User.new(first_name: "John", last_name: "Smith", email: "john@gmail.com", password: "ABCDEF", password_confirmation: "ABCDEFG")
#     @user.valid?
#     expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
#     end
#     it 'should not create a User if there is no password' do
#     @user = User.new(first_name: "John", last_name: "Smith", email: "john@gmail.com")
#     @user.valid?
#     expect(@user.errors[:password_digest]).to include("can\'t be blank")
#     end
#     it 'should not create a User if there the password is too short' do
#     @user = User.new(first_name: "John", last_name: "Smith", email: "john@gmail.com", password: "ABC", password_confirmation: "ABC")
#     @user.valid?
#     expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")














