Rails.application.routes.draw do
    # If we want to put our resources behind an `api/` route, just wrap them around
  scope '/api' do
    scope 'v1' do
      devise_for :admins,
        controllers: {
          sessions: 'admins/sessions',
          registrations: 'admins/registrations',
        }
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :customers
    end

  end

end
