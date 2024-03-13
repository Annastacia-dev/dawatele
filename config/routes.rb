Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  root "home#index"
  resources :products
  resources :vendors
  resources :medical_conditions
  resources :brands
  resources :product_subcategories
  resources :product_categories
end
