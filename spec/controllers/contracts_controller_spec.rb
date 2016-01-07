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

RSpec.describe ContractsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Contract. As you add validations to Contract, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      contract_type: 1,
      contract_name: "Contract Name",
      objectives: "Valid objective",
      confirmation_date: DateTime.now,
      approval_date: DateTime.now + 10,
      start_date: DateTime.now + 20,
      end_date: DateTime.now + 30,
      parties_attributes: [
        {
          party_name: "UP party",
          external: false
        },
        {
          party_name: "External party",
          external: true
        }
      ],
      financial_term_attributes: {
        payer: "Payer",
        payee: "Payee",
        amount: "9.99",
        frequency: "Frequency",
        start_date: DateTime.now,
        end_date: DateTime.now + 10,
        escalation_rate: "9.99",
        advance: "9.99",
        deposit: "9.99"
      },
      committees_attributes: [
        {
          committee_name: "Committee 1",
          responsibilities: "Commitee 1's responsibilities",
          committee_members_attributes: [
            {
              member_name: "Leader",
              leader: true
            },
            {
              member_name: "Member",
              leader: false
            }
          ]
        }
      ],
      physical_scope_attributes: {
        address: "Address",
        land_area: "9.99",
        boundaries: "Boundaries",
        use_of_premises: "Use of premises"
      }
    }
  }

  let(:invalid_attributes) {
    {
      contract_type: 4,
      objectives: "",
      start_date: DateTime.now,
      end_date: DateTime.now - 10,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContractsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do    
    context "Without a search parameter" do
      it "assigns all contracts as @contracts" do
        contract = Contract.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:contracts)).to eq([contract])
      end
    end

    context "With a search parameter" do
      it "assigns only matching contracts as @contracts" do
        contract = Contract.create! valid_attributes
        Contract.reindex
        get :index, {:search => "Valid"}, valid_session
        expect(assigns(:contracts).results).to eq([contract])
      end

      it "assigns only matching contracts as @contracts" do
        contract = Contract.create! valid_attributes
        Contract.reindex
        get :index, {:search => "Invalid"}, valid_session
        expect(assigns(:contracts).results).not_to eq([contract])
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested contract as @contract" do
      contract = Contract.create! valid_attributes
      get :show, {:id => contract.to_param}, valid_session
      expect(assigns(:contract)).to eq(contract)
      expect(assigns(:parties)).to eq(contract.parties)
      expect(assigns(:committees)).to eq(contract.committees)
      expect(assigns(:financial_term)).to eq(contract.financial_term)
      expect(assigns(:physical_scope)).to eq(contract.physical_scope)
    end
  end

  describe "GET #new" do
    it "assigns a new contract as @contract" do
      get :new, {}, valid_session
      expect(assigns(:contract)).to be_a_new(Contract)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contract as @contract" do
      contract = Contract.create! valid_attributes
      get :edit, {:id => contract.to_param}, valid_session
      expect(assigns(:contract)).to eq(contract)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contract" do
        expect {
          post :create, {:contract => valid_attributes}, valid_session
        }.to change(Contract, :count).by(1)
      end

      it "assigns a newly created contract as @contract" do
        post :create, {:contract => valid_attributes}, valid_session
        expect(assigns(:contract)).to be_a(Contract)
        expect(assigns(:contract)).to be_persisted
      end

      it "redirects to the created contract" do
        post :create, {:contract => valid_attributes}, valid_session
        expect(response).to redirect_to(Contract.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contract as @contract" do
        post :create, {:contract => invalid_attributes}, valid_session
        expect(assigns(:contract)).to be_a_new(Contract)
      end

      it "re-renders the 'new' template" do
        post :create, {:contract => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          contract_type: 1,
          contract_name: "Updated  Name",
          objectives: "Updated objective",
          confirmation_date: DateTime.now,
          approval_date: DateTime.now + 10,
          start_date: DateTime.now + 20,
          end_date: DateTime.now + 30,
          parties_attributes: [
            {
              party_name: "UP party",
              external: false
            },
            {
              party_name: "Updated External party",
              external: true
            }
          ],
          financial_term_attributes: {
            payer: "Updated Payer",
            payee: "Updated Payee",
            amount: "9.99",
            frequency: "Frequency",
            start_date: DateTime.now,
            end_date: DateTime.now + 10,
            escalation_rate: "9.99",
            advance: "9.99",
            deposit: "9.99"
          },
          committees_attributes: [
            {
              committee_name: "Updated Committee 1",
              responsibilities: "Updated Commitee 1's responsibilities",
              committee_members_attributes: [
                {
                  member_name: "Updated Leader",
                  leader: true
                },
                {
                  member_name: "Updated Member",
                  leader: false
                }
              ]
            }
          ],
          physical_scope_attributes: {
            address: "Address",
            land_area: "9.99",
            boundaries: "Updated Boundaries",
            use_of_premises: "Updated Use of premises"
          }
        }
      }

      it "updates the requested contract" do
        contract = Contract.create! valid_attributes
        put :update, {:id => contract.to_param, :contract => new_attributes}, valid_session
        contract.reload
        expect(assigns(:contract).objectives).to match(new_attributes[:objectives])
      end

      it "assigns the requested contract as @contract" do
        contract = Contract.create! valid_attributes
        put :update, {:id => contract.to_param, :contract => valid_attributes}, valid_session
        expect(assigns(:contract)).to eq(contract)
      end

      it "redirects to the contract" do
        contract = Contract.create! valid_attributes
        put :update, {:id => contract.to_param, :contract => valid_attributes}, valid_session
        expect(response).to redirect_to(contract)
      end
    end

    context "with invalid params" do
      it "assigns the contract as @contract" do
        contract = Contract.create! valid_attributes
        put :update, {:id => contract.to_param, :contract => invalid_attributes}, valid_session
        expect(assigns(:contract)).to eq(contract)
      end

      it "re-renders the 'edit' template" do
        contract = Contract.create! valid_attributes
        put :update, {:id => contract.to_param, :contract => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contract" do
      contract = Contract.create! valid_attributes
      expect {
        delete :destroy, {:id => contract.to_param}, valid_session
      }.to change(Contract, :count).by(-1)
    end

    it "redirects to the contracts list" do
      contract = Contract.create! valid_attributes
      delete :destroy, {:id => contract.to_param}, valid_session
      expect(response).to redirect_to(contracts_url)
    end
  end

end
