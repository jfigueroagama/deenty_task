class SearchController < ApplicationController

  def search
    if params[:term].nil?
      @doctors = []
    else
      term = params[:term]
      @doctors = Doctor.search term, fields: [:name], highlight:  true, index_name: [Doctor]
    end
  end

  def typeahead
    render json: Doctor.search(params[:term], {
      fields: ["name"],
      limit: 10,
      load: false,
      misspellings: {below: 5},
    }).map do |doctor| { title: doctor.name, value: doctor.id } end
  end

end
