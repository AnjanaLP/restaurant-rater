Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about',                to: 'static_pages#about'
  get '/help',                 to: 'static_pages#help'
  get '/contact',              to: 'static_pages#contact'
  get '/terms-and-conditions', to: 'static_pages#terms', as: 'terms'
  get '/signup',               to: 'users#new'
  resources :users, except: [:index]
  get '/login',                to: 'sessions#new'
  post '/login',               to: 'sessions#create'
  delete 'logout',             to: 'sessions#destroy'
  resources :restaurants do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end
end
