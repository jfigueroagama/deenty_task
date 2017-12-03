class SearchController < ApplicationController

  def search
    if params[:term].nil?
      @countries = []
    else
      term = params[:term]
      @countries = Country.search term, fields: [:name], highlight:  true
    end
  end

  def typeahead
    render json: Country.search(params[:term], {
      fields: ["name"],
      limit: 10,
      load: false,
      misspellings: {below: 5},
    }).map do |country| { name: country.name, value: country.id } end
  end

end
