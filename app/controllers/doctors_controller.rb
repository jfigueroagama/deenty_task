class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.paginate(page: params[:page])
  end

  def show
    @doctor = Doctor.find params[:id]
  end

  private
    def doctor_params
      params.require(:doctor).permit :name
    end
end
