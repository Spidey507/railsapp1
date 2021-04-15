Rails.application.routes.draw do
  devise_for :user
  root "static_pages#landing_page"
  resources :articles do
    resources :comments
  end

  get "/welcome", as: "landing_page", to: "static_pages#landing_page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

