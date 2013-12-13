Xsn::Application.routes.draw do
  # Authentication (Devise) and Authorization (CanCan)
  devise_for :users
    
  class PrivelegedUserConstraint
    def self.matches?(request)
      request.env['warden'].authenticated? && request.env['warden'].user.role != "user" 
    end
  end  
  
  # Our common routes
  get "welcome/index"
  get "welcome_authorized/index"
  get "welcome/about" => "welcome#about"

  # Rails admin for resource management
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # Root entries 
  root "welcome_authorized#index", as: :authenticated_root, constraints: lambda { |r| r.env["warden"].authenticate? }
  root "welcome#index"  
end
