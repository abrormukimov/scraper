Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles do
        match "/scrape", to: "articles#scrape", via: :post, on: :collection
      end
    end
  end

  root "api/v1/articles#index"
end
