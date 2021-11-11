class API::V1::FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @products = current_api_user.favorite_products
  end

  def create
    @favorite = current_api_user.favorites.new(favorite_params)

    if @favorite.save
      render_success!
    else
      unprocessable_entity(@favorite.errors.full_messages.join(", "))
    end
  end

  protected

  def favorite_params
    params.require(:favorite).permit(:product_id)
  end
end
