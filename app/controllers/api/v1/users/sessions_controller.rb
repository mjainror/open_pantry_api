class API::V1::Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user, only: %w(logout)

  def create
    @user = User.find_by_email(sign_in_params[:email])

    if @user && @user.valid_password?(sign_in_params[:password])
      sign_in_user!

      render_success!
    else
      invalid_login_attempt!
    end
  end

  def logout
    sign_out!

    render_success!
  end

  private

  def sign_in_user!
    response.headers["X-User-Token"] = @user.generate_jwt
  end

  def sign_out!
    response.headers["X-User-Token"] = current_api_user.expire_jwt
  end
end
