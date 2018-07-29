module PetRoutes
  def self.extended(router)
    router.instance_exec do
      resources :pets, only: [:create, :show]
      namespace :pets do
        get ':id/matches', to: 'matches#index'
      end
    end
  end
end