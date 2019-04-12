Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :movies , only: [:index, :show] do
      patch 'playback', on: :member
    end
    resources :series , only: [:index, :show]
    resources :episodes , only: [:show]
    # resources :rents , only: [:index]
    get '/rents', to: 'rentals#index' 

  end  
end
