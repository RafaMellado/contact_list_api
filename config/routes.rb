Rails.application.routes.draw do
  resources :contact_histories
  resources :contacts, except: [:index]
  resources :contact_books
  resources :users, param: :_username, except: %i[index destroy]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
