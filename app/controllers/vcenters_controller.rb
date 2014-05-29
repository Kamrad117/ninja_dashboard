class VcentersController < ApplicationController
  before_action :set_vcenter, only: [:show, :edit, :update, :destroy, :pool]

  # GET /vcenters
  # GET /vcenters.json
  def index
    @vcenters = Vcenter.all
  end

  # GET /vcenters/1
  # GET /vcenters/1.json
  def show
    @vcenter.get_data
  end

  # GET /vcenters/new
  def new
    @vcenter = Vcenter.new
  end

  # GET /vcenters/1/edit
  def edit
  end

  # POST /vcenters
  # POST /vcenters.json
  def create
    @vcenter = Vcenter.new(vcenter_params)

    respond_to do |format|
      if @vcenter.save!
        format.html { redirect_to @vcenter, notice: 'Vcenter was successfully created.' }
        format.json { render :show, status: :created, location: @vcenter }
      else
        format.html { render :new }
        format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vcenters/1
  # PATCH/PUT /vcenters/1.json
  def update
    respond_to do |format|
      if @vcenter.update(vcenter_params)
        format.html { redirect_to @vcenter, notice: 'Vcenter was successfully updated.' }
        format.json { render :show, status: :ok, location: @vcenter }
      else
        format.html { render :edit }
        format.json { render json: @vcenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vcenters/1
  # DELETE /vcenters/1.json
  def destroy
    @vcenter.destroy
    respond_to do |format|
      format.html { redirect_to vcenters_url, notice: 'Vcenter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pool 
    @vcenter.get_pools_data
    @pool = @vcenter.pools.detect { |p| p.name == params[:pool_name] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vcenter
      @vcenter = Vcenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vcenter_params
      params.require(:vcenter).permit(:url, :pool_name)
    end
end
