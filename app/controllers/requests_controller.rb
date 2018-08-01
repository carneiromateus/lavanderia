class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    @pecas = Peca.where(active: true).all
  end

  # GET /requests/1/edit
  def edit
    @pecas = Peca.where(active: true).all
  end

  # POST /requests
  # POST /requests.json
  def create

      @request = Request.new(request_params)
    params[:pecas].each do |p|
      @request.peca << Peca.find(p)
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
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    params[:pecas].each do |p|
      @request.peca << Peca.find(p)
      puts p
    end

    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:is_contract, :observation, :paid, :open, :delivery, pecas:[])
    end
end