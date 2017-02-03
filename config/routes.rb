Rails.application.routes.draw do
  get 'gifts/index'

  get 'gifts/show'

  get 'gifts/new'

  get 'gifts/edit'

  devise_for :users
  root 'home#index'

  resources :giftlists do
    resources :gifts
  end
end
