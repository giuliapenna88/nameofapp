require 'rails_helper'

describe ProductsController, :type => :controller do

      let (:admin) {FactoryGirl.create(:admin_user)}
      let (:product) {FactoryGirl.create(:product)}

    describe "GET #index" do
      subject {get :index}
        it "all products are shown" do
          expect(response).to have_http_status(200)
          expect(assigns(:products)).to eq Product.all
        end

        it 'renders the :index view' do
          expect(response).to render_template :index
        end

    end

    describe "GET #show" do
      subject {get :show, params:{id: product.id}}
      it "correct Product is shown" do
        expect(response).to have_http_status(200)
        expect(assigns(:product)).to eq product

    end

      it 'renders the #show view' do
      expect(response).to render_template :show
    end

  end

  describe "GET #new" do

    before do
      sign_in @admin
    end

    subject {get :new}
    it 'renders the :new view' do
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

  end

  describe 'GET #edit' do

    before do
      sign_in @admin
    end
    subject {get :edit, params:{id: product.id}}

    it 'renders the #edit template' do

      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

  end

  describe 'POST #create' do

    before do
      sign_in @admin
    end

    context 'Sending valid data' do

      subject {post :create, product: FactoryGirl.attributes_for(:product)}
      it 'creates a new product' do
      expect{subject}.to change(Product, :count).by(1)
      end

      it 'redirects to products#index' do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(product_path(Product.last))
      end

    end

  end

  describe 'PUT #update' do


    before do
      sign_in @admin
    end

    context 'valid attributes' do
      let (:product_name) {FactoryGirl.attributes_for(:product)[:name]}
      subject {put :update, id: product, product: FactoryGirl.attributes_for(:product), name: product_name}

      it 'located the requested @product' do
        expect(assigns(:product)).to eq(product)
      end

    context 'when the product name is being updated' do
      let (:product_name) {'updated_product'}
          it 'changes attributes of @product' do
            expect{subject}.to change{:product.reload.name}
          end
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes a product" do
      delete :destroy, params:{id: @product.id}

      expect{@product.destroy}.to change(Product, :count).by(-1)

    end

  end

end
