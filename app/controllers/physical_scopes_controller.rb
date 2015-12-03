class PhysicalScopesController < ApplicationController
  before_action :set_physical_scope, only: [:show, :edit, :update, :destroy]

  # GET /physical_scopes
  # GET /physical_scopes.json
  def index
    @physical_scopes = PhysicalScope.all
  end

  # GET /physical_scopes/1
  # GET /physical_scopes/1.json
  def show
  end

  # GET /physical_scopes/new
  def new
    @physical_scope = PhysicalScope.new
  end

  # GET /physical_scopes/1/edit
  def edit
  end

  # POST /physical_scopes
  # POST /physical_scopes.json
  def create
    @physical_scope = PhysicalScope.new(physical_scope_params)

    respond_to do |format|
      if @physical_scope.save
        format.html { redirect_to @physical_scope, notice: 'Physical scope was successfully created.' }
        format.json { render :show, status: :created, location: @physical_scope }
      else
        format.html { render :new }
        format.json { render json: @physical_scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_scopes/1
  # PATCH/PUT /physical_scopes/1.json
  def update
    respond_to do |format|
      if @physical_scope.update(physical_scope_params)
        format.html { redirect_to @physical_scope, notice: 'Physical scope was successfully updated.' }
        format.json { render :show, status: :ok, location: @physical_scope }
      else
        format.html { render :edit }
        format.json { render json: @physical_scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_scopes/1
  # DELETE /physical_scopes/1.json
  def destroy
    @physical_scope.destroy
    respond_to do |format|
      format.html { redirect_to physical_scopes_url, notice: 'Physical scope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_scope
      @physical_scope = PhysicalScope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physical_scope_params
      params.require(:physical_scope).permit(:address, :land_area, :boundaries, :use_of_premises, :contract_id)
    end
end
