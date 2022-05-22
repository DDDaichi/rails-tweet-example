Rails.application.routes.draw do
  # / にアクセスしたらtopを表示
  root 'static_pages#top'
  get '/tweets', to:'tweets#new'
  post 'tweets/create', to:'tweets#create'
  get '/contacts', to:'contacts#new'
  post '/contacts/create', to:'contacts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
