class SearchController < ApplicationController

  def search
    if params[:term].nil?
      @countries = []
    else
      @countries = Country.search params[:term]
    end
  end
  
end
