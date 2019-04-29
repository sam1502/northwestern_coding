class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: [:show, :edit, :update, :destroy]

  def home
    if session[:coordinator_id]
      redirect_to "/login"
    end
  end

  def index
    @coordinators = Coordinator.all
  end

  def new
    @coordinator = Coordinator.new
  end

  def login
    @coordinator = Coordinator.find(params[:email, :password])
    if @coordinator.nil?
      flash[:errors] = "Coordinator not found!"
      redirect_to "/home"
    else
      session[:coordinator_id] = @coordinator_id
      redirect_to "/registries"
    end
  end
  
  def create
    @coordinator = Coordinator.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        format.html { redirect_to "/home", notice: 'Coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @coordinator = Coordinator.find(params[:coordinator_id])
  end

  # PATCH/PUT /coordinators/1
  # PATCH/PUT /coordinators/1.json
  def update
    respond_to do |format|
      if @coordinator.update(coordinator_params)
        format.html { redirect_to @coordinator, notice: 'Coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordinators/1
  # DELETE /coordinators/1.json
  def destroy
    @coordinator.destroy
    respond_to do |format|
      format.html { redirect_to coordinators_url, notice: 'Coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = Coordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password, :phoneNumber)
    end
end
