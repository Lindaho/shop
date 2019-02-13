Rails.application.routes.draw do
  resources :users, :except => [:new, :edit] do
  	member do
  		put :address
  	end

  	resource :shop
  end
end
