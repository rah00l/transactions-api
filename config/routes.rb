Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :transactionable do
    resources :transactions, only: [:index, :create, :update]
  end

  resources :consumers, only: [:index, :create, :update], concerns: :transactionable
  resources :merchants, only: [:index, :create, :update], concerns: :transactionable
end
