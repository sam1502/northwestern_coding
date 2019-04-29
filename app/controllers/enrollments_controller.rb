class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  def index
    @enrollments = Enrollment.all
  end

  def show
  end

  def new
    @registries = Coordinator.find(session[:coordinator_id]).registries
    @participants = Participants.all
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.coordinator_id= session[:coordinator_id]
      if @enrollment.save
       flash[:successfully] = "Enrollment successful!"
       redirect_to "/registries"
      else
        flash[:errors] = "Enrollment failed!"
        redirect_to "/enrollment/new"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:date_of_enrollment, :method_of_contact, :remarks)
    end
end
