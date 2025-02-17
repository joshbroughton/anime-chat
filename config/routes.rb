Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define a route that renders a JSON response with a message "Hello World"
  get "hello" => "hello#get"

  # Define a route that renders a JSON response with a message from the OpenAI API
  get "hello/bot" => "hello#get_bot"
  # Defines the root path route ("/")
  # root "posts#index"
end
