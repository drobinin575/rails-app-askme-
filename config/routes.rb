Rails.application.routes.draw do
  root to: 'questions#index'
  put '/questions/:id/hide', to: 'questions#hide'
  resources :questions
end
