Rails.application.routes.draw do
  resources :users do
    collection do
      post :send_users_list_as_csv
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
