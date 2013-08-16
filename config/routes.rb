Vandaalen::Application.routes.draw do

  get 'login', to: "sessions#new", as: "login"
  get 'logout', to: "sessions#destroy", as: "logout"
  get 'education', to: "degrees#index", as: "education"
  get 'employment', to: "positions#index", as: "employment"
  get 'code', to: "projects#index", as: "code"

  resources :users
  resources :degrees, except: [:index, :show]
  resources :positions, except: [:index, :show]
  scope 'code', as: "code" do
    resources :projects, except: [:index, :show]
    resources :files, except: [:index]  
  end
  resources :schools, except: [:show]
  resource :sessions, only: [:create]

  match "", to: "users#show",
    constraints: { subdomain: /^(?!www)(.+)$/i }
  root to: "users#index"

end
