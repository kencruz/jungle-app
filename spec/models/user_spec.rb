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
  end

end
