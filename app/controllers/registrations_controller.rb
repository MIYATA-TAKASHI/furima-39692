# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :kana_last_name, :kana_first_name, :birthdate])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :kana_last_name, :kana_first_name, :birthdate])
  end
end