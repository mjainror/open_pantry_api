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
end
