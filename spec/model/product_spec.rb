require 'rails_helper'
  describe Product do
    before do
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product)
      FactoryGirl.create(:comment, rating: 1, user: @user, product: @product)
      FactoryGirl.create(:comment, rating: 3, user: @user, product: @product)
      FactoryGirl.create(:comment, rating: 5, user: @user, product: @product)
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)
    end

    it "invalidates a product without a product name" do
      expect(Product.new(description: " Nice bike ")).not_to be_valid
    end
end