Rails.application.routes.draw do
  get 'main' => 'application#main'
  get 'lifx' => 'lifx#show'
  post 'lifx/set_status' => 'lifx#set_status'
end
