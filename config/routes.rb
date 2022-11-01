Rails.application.routes.draw do
  resources :events
  post "webhooks/alexa", to: "alexa#create"
end
