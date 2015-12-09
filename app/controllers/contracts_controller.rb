class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
    if params[:search].present?
      @contracts = Contract.search(params[:search])
    else
      @contracts = Contract.all
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new

    @contract.build_financial_term
    @contract.build_physical_scope

    @contract.parties.build
    @contract.committees.build
    #@contract.committees.committee_members.build
  end

  # GET /contracts/1/edit
  def edit
    @contract.parties.build if @contract.parties.empty?
    @contract.committees.build if @contract.committees.empty?
    #@contract.committees.committee_members.build if @contract.committees.committee_members.empty?

    @contract.build_financial_term if @contract.financial_term.nil?
    @contract.build_physical_scope if @contract.physical_scope.nil?
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
      @parties = @contract.parties
      @committees = @contract.committees
      @financial_term = @contract.financial_term
      @physical_scope = @contract.physical_scope
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(
        :contract_type, 
        :objectives, 
        :start_date, 
        :end_date, 
        financial_term_attributes: [
          :id, 
          :payer,
          :payee,
          :amount,
          :frequency,
          :start_date,
          :end_date,
          :escalation_rate,
          :advance,
          :deposit,
          :contract_id,
          :_destroy
        ], 
        physical_scope_attributes: [
          :id,
          :address,
          :land_area,
          :boundaries,
          :use_of_premises,
          :contract_id,
          :_destroy
        ],
        committees_attributes: [
          :id,
          :committee_name,
          :responsibilities,          
          :contract_id,
          :_destroy,
          committee_members_attributes: [
            :id,
            :member_name,
            :leader,
            :committee_id,
            :_destroy
          ]
        ],
        parties_attributes: [
          :id,
          :party_name,
          :external,
          :contract_id,
          :_destroy
        ]
      )
    end
end
