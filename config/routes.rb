Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "organizations#new"
  resources :organizations
  get 'update_orgs' , to: 'organizations#update_orgs', as: 'update_orgs'
end
