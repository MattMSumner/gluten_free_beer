Rails.application.routes.draw do
  jsonapi_resources :beers

  mount_ember_app :frontend, to: "/"
end
