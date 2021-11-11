Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: "api/v1/users/sessions",
                                        registrations: "api/v1/users/registrations" }

      devise_for :suppliers, controllers: { registrations: "api/v1/suppliers/registrations" }, skip: %w(sessions passwords)
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :users do
        devise_scope :user do
          post "logout" => "sessions#logout"
        end
      end

      resources :categories, only: %w(index)

      resources :suppliers, only: %w(show) do
        collection do
          post :supply_category
          
          resources :products, only: %w(index create), module: :suppliers
        end
      end

      resources :products, only: %w(index)
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
