require 'elasticsearch/model'

class Country < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
