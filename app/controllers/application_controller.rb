class ApplicationController < ActionController::API
  
  protected

  def render_success!
    render json: { 
      success: true 
    }, status: 200 and return
  end

  def invalid_login_attempt!
    render json: {
      success: false,
      error: "invalid login credentials!"
    }, status: 422 and return
  end

  def unauthorized_access!
    render json: {
      success: false,
      error: "Unauthorized Access!"
    }, status: 401 and return
  end

  def current_api_user
    @current_api_user ||= request.headers["X-User-Token"].present? ? get_decoded_user(request.headers["X-User-Token"]) : nil
  end

  def authenticate_user
    unauthorized_access! if current_api_user.blank?
  end

  def current_supplier
    @current_supplier ||= current_api_user.supplier? ? current_api_user : nil
  end

  def authenticate_supplier
    unauthorized_access! if current_supplier.blank?
  end

  def get_decoded_user(token)
    jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    User.find(jwt_payload['id'])
  end
end
