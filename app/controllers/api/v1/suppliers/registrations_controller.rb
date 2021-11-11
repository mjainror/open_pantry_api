class API::V1::Suppliers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :configure_permitted_parameters, only: %w(create)

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end
end
