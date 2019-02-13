Rails.application.routes.draw do
  resources :users do
  	member do
  		post :address
  	end
  end
end
