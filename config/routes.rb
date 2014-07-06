Rails.application.routes.draw do

  root to: "stores#index"

  resources :stores do
    resources :beers
  end

end
