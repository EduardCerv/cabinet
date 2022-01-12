Rails.application.routes.draw do
  get 'welcome/index'

  # This make the home page is going to the controller#action that you need for this example in welcome contrller and index action
  root 'welcome#index'

  resources :docs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
