Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }  
  
  resources :users, only: [:show]  

  root to: 'events#index'  


  resources :events do
  resources :comments, only: [:create, :destroy]
  end

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end
end
