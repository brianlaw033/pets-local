module CustomerRoutes
  def self.extended(router)
    router.instance_exec do
      resources :customers, only: [:create, :show]
      namespace :customers do
        get ':id/matches', to: 'matches#index'
        patch ':id/adopt', to: 'adoptions#update'
      end
    end
  end
end