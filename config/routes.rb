Rails.application.routes.draw do
  resources :shortened_links, only: [:index]
  get '/:path', to: 'redirections#index'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
