KeywordMonitor::Application.routes.draw do
  root to: 'application#app'

  namespace :api, defaults: {format: :json} do
    resources :projects do
      resources :keywords do
        collection do
          get :update_positions
        end
      end
    end
  end
end
