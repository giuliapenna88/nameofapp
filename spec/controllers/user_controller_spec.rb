require 'rails_helper'

describe UsersController, type: :controller do

before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #show" do

    context "User is logged in" do
      before do
        it "loads the correct user details" do
          expect(response).to have_http_status(200)
          expect(assign(:user)).to eq @user
        end
      end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: @user.id
      end
    end

    context 'Cannont access second users show page' do
       it "redirects to root" do
         get :show, params: {id: @user.id}
         redirect_to(root_path)
       end
     end
  end

end
