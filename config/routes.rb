KeywordMonitor::Application.routes.draw do
  root to: 'application#app'

  namespace :api, defaults: {format: :json} do
    resources :projects do
      resources :keywords
    end
  end
end
