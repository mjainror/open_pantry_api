class API::V1::ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search])
  end
end
