Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :stores do
      resources :slides, unless: :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
