require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it 'should create a user if all of the validations are true' do
    User.create(first_name: "chris ", last_name: "kim", email: "aa@gmail.com", password: "aabbccdd", password_confirmation: "aabbccdd")
    @user = User.new(first_name: "chris", last_name: "kim", email: "aa@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.valid?
    expect(@user.errors).not_to include ("can't be blank")
    end

    it 'should not create a user if their first name is missing' do
    @user = User.new( email: "aa@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.valid?
    expect(@user.errors[:first_name]).to include ("can't be blank")
    end

    it 'should not create a user if their last name is missing' do
    @user = User.new(first_name: "chris", email: "aa@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.valid?
    expect(@user.errors[:last_name]).to include ("can't be blank")
    end

    it 'should not create a user if their email is missing' do
    @user = User.new(first_name: "chris",last_name:"kim", password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.valid?
    expect(@user.errors[:email]).to include ("can't be blank")
    end

    it 'should not create a user if email is not unique' do
    @user1 = User.new(first_name: "chris", last_name:"kim" , email: "aa@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user1.save
    @user2 =  User.new(first_name: "chris",last_name:"kim" , email: "AA@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user2.valid?
    expect(@user2.errors[:email]).to include ("has already been taken")
    end

    it 'should not create a User if their passwords do not match' do
    @user = User.new(first_name: "chris",last_name:"kim", password: "aabbccdd" , password_confirmation: "aabbccss")
    @user.valid?
    expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'should not create a User if there is no password' do
    @user = User.new(first_name: "chris",last_name:"kim", email: "aa@gmail.com")
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'should not create a User if there the password is too short ' do
    @user = User.new(first_name: "chris",last_name:"kim", email: "aa@gmail.com", password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.valid?
    expect(@user.errors[:password]).to include()
    end


  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it ' should log the user in if the credentials are crorrect' do
    @user = User.new(first_name: "chris", last_name: "kim", email: "aa@gmail.com" , password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.save!
    expect(User.authenticate_with_credentials("aa@gmail.com", "aabbccdd")).to be_present
    end

    it 'should not log the user in if the email is wrong' do
    @user = User.new(first_name: "chris",last_name:"kim", email: "aa@gmail.com", password: "aabbccdd" , password_confirmation: "aabbccdd")
    @user.save!
    expect(User.authenticate_with_credentials("aa123123@gmail.com", "aabbccdd")).not_to be_present
    end

    it 'should not log the user in if the password is wrong' do
      @user = User.new(first_name: "chris",last_name:"kim", email: "aa@gmail.com", password: "aabbccdd" , password_confirmation: "aabbccdd")
      @user.save!
      expect(User.authenticate_with_credentials("aa@gmail.com", "aabbddss")).not_to be_present
    end

    it 'should log the user in even if the email contains spaces' do
      @user = User.new(first_name: "chris", last_name: "kim", email: "aa@gmail.com", password: "aabbccdd", password_confirmation: "aabbccdd")
      @user.save!
      expect(User.authenticate_with_credentials("  aa@gmail.com   ", "aabbccdd")).to be_present
    end

    it 'should log the user in even if the email is typed with a different case' do
      @user = User.new(first_name: "chris", last_name: "kim", email: "aa@gmail.com", password: "aabbccdd", password_confirmation: "aabbccdd")
      @user.save!
      expect(User.authenticate_with_credentials("  AA@gmail.com   ", "aabbccdd")).to be_present
    end
  end
end



















