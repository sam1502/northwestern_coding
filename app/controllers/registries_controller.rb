class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  def index
    @registries = Registry.includes(:coordinators)
    @coordinators = Coordinator.all
  end

  def show
    @registry= Registry.find(params[:registry_id])
  end

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
      if @registry.save
       redirect_to "/registries"
      else
        flash[:errors] = "Registry not created!"
      end
  end

  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_params
      params.require(:registry).permit(:name, :location, :state)
    end
end
