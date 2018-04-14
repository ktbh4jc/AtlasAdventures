# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe 'when name is not present' do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when name is too long' do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe 'when email format is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe 'when email address is already taken' do
    before do
      user_with_same_email = @user.dup
      # It is important to make sure the username isn't what makes this invalid
      user_with_same_email.username = 'other_user'
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe 'when email is entered with capital letters' do
    it 'should downcase the email' do
      mixed_case_email = 'FoO@exAmplE.BAr'
      @user.email = mixed_case_email
      @user.save
      expect(@user.email).to eq mixed_case_email.downcase
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      usernames = %w[ktbh4jc super_fly dandy_dANDd]
      usernames.each do |valid_username|
        @user.username = valid_username
        expect(@user).to be_valid
      end
    end
  end

  describe 'when username is already taken' do
    before do
      user_with_same_username = @user.dup
      # It is important to make sure the email isn't what makes this invalid
      user_with_same_username.email = 'other_email@example.com'
      user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

  describe 'when username is entered with capital letters' do
    it 'should downcase the username' do
      mixed_case_username = 'ExAmPlE'
      @user.username = mixed_case_username
      @user.save
      expect(@user.username).to eq mixed_case_username.downcase
    end
  end

  describe 'when password doesn\'t match confirmation' do
    before { @user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before do
      @user = User.new(name: 'Example User', email: 'user@example.com',
                       password: ' ', password_confirmation: ' ')
    end
    it { should_not be_valid }
  end

  describe 'when password is too short' do
    before do
      @user = User.new(name: 'Example User', email: 'user@example.com',
                       password: 'a' * 5, password_confirmation: 'a' * 5)
    end
    it { should_not be_valid }
  end
end
