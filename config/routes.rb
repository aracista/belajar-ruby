Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/home', to: 'home#index'
get '/halo/:id', to: 'home#halo'


resources :books do
	get :active, on: :collection
	patch :toggle, on: :member
end
end

