Labor::Application.routes.draw do
  root 'dashboard#index'
  get 'search', to: 'dashboard#search'
end
