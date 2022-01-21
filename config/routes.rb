Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :docs
  authenticate :user do
    root "docs#index", as: :authenticated_root
  end

  # This make the home page is going to the controller#action that you need for this example in welcome contrller and index action
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
