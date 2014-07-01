Rails.application.routes.draw do

  resources :stores do
    resources :beers
  end

end
