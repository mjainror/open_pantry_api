Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: "api/v1/users/sessions",
                                        registrations: "api/v1/users/registrations" }
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: %w(index)

      resources :suppliers, only: %w(show) do
        collection do
          post :supply_category
          
          resources :products, only: %w(index create), module: :suppliers
        end

      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
