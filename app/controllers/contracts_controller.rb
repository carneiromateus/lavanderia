class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
    @pecas = Peca.where(active: true).all
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
     @pecas = Peca.where(active: true).all
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @pecas = Peca.where(active: true).all
  end

  # GET /contracts/1/edit
  def edit
    @pecas = Peca.where(active: true).all
  end

  # POST /contracts
  # POST /contracts.json
  def create

    @contract = Contract.new(contract_params)
    params[:pecas].each do |p|
      @contract.peca << Peca.find(p)
      puts p
    end
    puts "treta"
    puts params["pecas"]
    puts params
      # peca = Peca.new 
      # peca.name = params[:peca_name]
      # peca.value = params[:peca_value]
      # peca.active = true
      # peca.save
      
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
    params[:pecas].each do |p|
      @contract.peca << Peca.find(p)
      puts p
    end

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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:initialDate, :finalDate, pecas:[])
    end
end
