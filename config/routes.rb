Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'doctors#index'
  resources :countries, only: [:index, :show]
  resources :doctors, only: [:index, :show]
  get "search", to: "search#search"
  get "search/typeahead/:term" => "search#typeahead"
end
