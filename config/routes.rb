MyBasecamp::Application.routes.draw do
 root "projects#index"

 resources :projects, only: [:index, :new, :create, :show]
end
