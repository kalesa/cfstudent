require 'rails_helper'
  describe Product do
    before do
      @product = FactoryGirl.create(:product)
      @product = Product.create!(name: "race bike", price: 1000)
      @user = User.create!(email: "iza_abao@yahoo.com", password: "Maharlika0")
      @product.comments.create!(rating: 1, user: @user, body: "Stable at speed and over rough stuff")
      @product.comments.create!(rating: 3, user: @user, body: "Latest trail bike is one to watch")
      @product.comments.create!(rating: 5, user: @user, body: "Better brakes")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)
    end

    it "invalidates a product without a product name" do
      expect(Product.new(description: " Nice bike ")).not_to be_valid
    end
end


