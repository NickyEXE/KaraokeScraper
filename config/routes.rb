Rails.application.routes.draw do
  get '/search/:query', to: 'search#process_search'
end
