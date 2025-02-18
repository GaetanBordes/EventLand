Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }  # Devise pour gérer les sessions utilisateurs
  
  resources :users, only: [:show]  # Route pour afficher le profil utilisateur

  root to: 'events#index'  # Racine de l'application

  # Autres ressources, par exemple, pour les événements
  resources :events
end
