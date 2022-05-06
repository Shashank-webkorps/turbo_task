Rails.application.routes.draw do
  resources :student_details do
    collection do
      get 'list'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "student_details#index"
end
