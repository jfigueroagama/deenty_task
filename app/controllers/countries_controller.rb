class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find params[:id]
  end

  private
    def article_params
      params.require(:country).permit :name
    end
end
