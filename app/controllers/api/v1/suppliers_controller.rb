class API::V1::SuppliersController < ApplicationController
  before_action :authenticate_supplier

  def supply_category
    current_supplier.update(category_ids: params[:category_ids])

    render_success!
  end
end
