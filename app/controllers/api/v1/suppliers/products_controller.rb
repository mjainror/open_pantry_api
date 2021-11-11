class API::V1::Suppliers::ProductsController < ApplicationController
  before_action :authenticate_supplier

  def index
    @products = current_supplier.products
  end

  def create
    @product = current_supplier.products.new(product_params)

    if @product.save
      render_success!
    else
      unprocessable_entity(@product.errors.full_messages.join(", "))
    end
  end

  protected

  def product_params
    params.require(:product).permit(:name, :description, :sku, :supplier_category_id)
  end
end
