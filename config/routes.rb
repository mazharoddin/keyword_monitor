KeywordMonitor::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :projects do
      resources :keywords
    end
  end
end
