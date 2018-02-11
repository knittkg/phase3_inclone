Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :postpicts do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
