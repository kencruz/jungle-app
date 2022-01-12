require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid without a password" do
      @user = User.new
      @user.first_name = "Ken"
      @user.last_name = "Masters"
      @user.email = "test@example.com"
      @user.password_confirmation = "12341234"

      expect(@user).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
      @user = User.new
      @user.first_name = "Ken"
      @user.last_name = "Masters"
      @user.email = "test@example.com"
      @user.password = "12341234"

      expect(@user).to_not be_valid
    end

    it "should have matching password and password_confirmation fields" do
      @user = User.new
      @user.first_name = "Ken"
      @user.last_name = "Masters"
      @user.email = "test@example.com"
      @user.password = "12341234"
      @user.password_confirmation = "12341234"

      expect(@user).to be_valid
    end

    it "is not valid without a unique email" do
      @user1 = User.new
      @user1.first_name = "Ken"
      @user1.last_name = "Masters"
      @user1.email = "test@example.com"
      @user1.password = "12341234"
      @user1.password_confirmation = "12341234"
      @user1.save

      @user2 = User.new
      @user2.first_name = "Ryu"
      @user2.last_name = "Hayabusha"
      @user2.email = "TEST@example.com"
      @user2.password = "12341234"
      @user2.password_confirmation = "12341234"

      expect(@user2).to_not be_valid
    end

    it "is not valid without an email" do
      @user = User.new
      @user.first_name = "Ken"
      @user.last_name = "Masters"
      @user.password = "12341234"
      @user.password_confirmation = "12341234"

      expect(@user).to_not be_valid
    end

    it "is not valid without a first name" do
      @user = User.new
      @user.last_name = "Masters"
      @user.email = "test@example.com"
      @user.password = "12341234"
      @user.password_confirmation = "12341234"

      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user = User.new
      @user.first_name = "Ken"
      @user.email = "test@example.com"
      @user.password = "12341234"
      @user.password_confirmation = "12341234"

      expect(@user).to_not be_valid
    end
  end

end
