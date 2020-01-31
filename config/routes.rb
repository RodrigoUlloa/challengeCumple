Rails.application.routes.draw do
  get 'quotes', to: 'quotes#index'
  post 'quotes', to: 'quotes#result'

  root 'quotes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
