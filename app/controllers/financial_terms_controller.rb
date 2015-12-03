class FinancialTermsController < ApplicationController
  before_action :set_financial_term, only: [:show, :edit, :update, :destroy]

  # GET /financial_terms
  # GET /financial_terms.json
  def index
    @financial_terms = FinancialTerm.all
  end

  # GET /financial_terms/1
  # GET /financial_terms/1.json
  def show
  end

  # GET /financial_terms/new
  def new
    @financial_term = FinancialTerm.new
  end

  # GET /financial_terms/1/edit
  def edit
  end

  # POST /financial_terms
  # POST /financial_terms.json
  def create
    @financial_term = FinancialTerm.new(financial_term_params)

    respond_to do |format|
      if @financial_term.save
        format.html { redirect_to @financial_term, notice: 'Financial term was successfully created.' }
        format.json { render :show, status: :created, location: @financial_term }
      else
        format.html { render :new }
        format.json { render json: @financial_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_terms/1
  # PATCH/PUT /financial_terms/1.json
  def update
    respond_to do |format|
      if @financial_term.update(financial_term_params)
        format.html { redirect_to @financial_term, notice: 'Financial term was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial_term }
      else
        format.html { render :edit }
        format.json { render json: @financial_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_terms/1
  # DELETE /financial_terms/1.json
  def destroy
    @financial_term.destroy
    respond_to do |format|
      format.html { redirect_to financial_terms_url, notice: 'Financial term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_term
      @financial_term = FinancialTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_term_params
      params.require(:financial_term).permit(:payer, :payee, :amount, :frequency, :start_date, :end_date, :escalation_rate, :advance, :deposit, :contract_id)
    end
end
