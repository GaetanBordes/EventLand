class RegistrationsController < Devise::RegistrationsController
  # Permettre à l'utilisateur de mettre à jour uniquement l'email et le mot de passe
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Méthode pour permettre la modification uniquement de l'email et du mot de passe
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
  end
end
