class CountriesController < ApplicationController

  def index
    @countries = Country.paginate(page: params[:page])
  end

  def show
    @country = Country.find params[:id]
  end

  private
    def country_params
      params.require(:country).permit :name
    end
end
