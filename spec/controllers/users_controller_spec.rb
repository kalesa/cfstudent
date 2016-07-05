require 'rails_helper'

describe UsersController, :type => :controller do
  context "GET #show" do
    before do
      sign_in user

    it "Loads correct user details"
      get :show, id: current_user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:user)).to eq user
    end
  end

  let(:user) { User.create!(email: "iza_abao@yahoo.com", password: "Maharlika0") }

  describe "GET #show" do
     context "User is logged in" do

     end

     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end
