require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe FinancialTermsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # FinancialTerm. As you add validations to FinancialTerm, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FinancialTermsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all financial_terms as @financial_terms" do
      financial_term = FinancialTerm.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:financial_terms)).to eq([financial_term])
    end
  end

  describe "GET #show" do
    it "assigns the requested financial_term as @financial_term" do
      financial_term = FinancialTerm.create! valid_attributes
      get :show, {:id => financial_term.to_param}, valid_session
      expect(assigns(:financial_term)).to eq(financial_term)
    end
  end

  describe "GET #new" do
    it "assigns a new financial_term as @financial_term" do
      get :new, {}, valid_session
      expect(assigns(:financial_term)).to be_a_new(FinancialTerm)
    end
  end

  describe "GET #edit" do
    it "assigns the requested financial_term as @financial_term" do
      financial_term = FinancialTerm.create! valid_attributes
      get :edit, {:id => financial_term.to_param}, valid_session
      expect(assigns(:financial_term)).to eq(financial_term)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FinancialTerm" do
        expect {
          post :create, {:financial_term => valid_attributes}, valid_session
        }.to change(FinancialTerm, :count).by(1)
      end

      it "assigns a newly created financial_term as @financial_term" do
        post :create, {:financial_term => valid_attributes}, valid_session
        expect(assigns(:financial_term)).to be_a(FinancialTerm)
        expect(assigns(:financial_term)).to be_persisted
      end

      it "redirects to the created financial_term" do
        post :create, {:financial_term => valid_attributes}, valid_session
        expect(response).to redirect_to(FinancialTerm.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved financial_term as @financial_term" do
        post :create, {:financial_term => invalid_attributes}, valid_session
        expect(assigns(:financial_term)).to be_a_new(FinancialTerm)
      end

      it "re-renders the 'new' template" do
        post :create, {:financial_term => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested financial_term" do
        financial_term = FinancialTerm.create! valid_attributes
        put :update, {:id => financial_term.to_param, :financial_term => new_attributes}, valid_session
        financial_term.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested financial_term as @financial_term" do
        financial_term = FinancialTerm.create! valid_attributes
        put :update, {:id => financial_term.to_param, :financial_term => valid_attributes}, valid_session
        expect(assigns(:financial_term)).to eq(financial_term)
      end

      it "redirects to the financial_term" do
        financial_term = FinancialTerm.create! valid_attributes
        put :update, {:id => financial_term.to_param, :financial_term => valid_attributes}, valid_session
        expect(response).to redirect_to(financial_term)
      end
    end

    context "with invalid params" do
      it "assigns the financial_term as @financial_term" do
        financial_term = FinancialTerm.create! valid_attributes
        put :update, {:id => financial_term.to_param, :financial_term => invalid_attributes}, valid_session
        expect(assigns(:financial_term)).to eq(financial_term)
      end

      it "re-renders the 'edit' template" do
        financial_term = FinancialTerm.create! valid_attributes
        put :update, {:id => financial_term.to_param, :financial_term => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested financial_term" do
      financial_term = FinancialTerm.create! valid_attributes
      expect {
        delete :destroy, {:id => financial_term.to_param}, valid_session
      }.to change(FinancialTerm, :count).by(-1)
    end

    it "redirects to the financial_terms list" do
      financial_term = FinancialTerm.create! valid_attributes
      delete :destroy, {:id => financial_term.to_param}, valid_session
      expect(response).to redirect_to(financial_terms_url)
    end
  end

end