Rails.application.routes.draw do
  resources :artists, except: [:destroy]
  resources :instruments, except: [:destroy]

  get 'form_instrument', to: 'artists#form_instrument', as: 'add_instrument'
  post 'add_instrument', to: 'artists#add_instrument', as: 'add_plays'
end
