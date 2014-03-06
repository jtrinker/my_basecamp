MyBasecamp::Application.routes.draw do
 root "projects#index"
 resources :projects, only: [:index, :show, :new]
end
