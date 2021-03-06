class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Authenticate to all pages
  before_filter :authenticate_user!  
  
  #### This is just a hack to reload RailsAdmin initialization ####
  before_filter :reload_rails_admin if :rails_admin_path?

  private

    def reload_rails_admin
      models = %W(User UserProfile)
      models.each do |m|
        RailsAdmin::Config.reset_model(m)
      end
      RailsAdmin::Config::Actions.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")
    end

    def rails_admin_path?
      controller_path =~ /rails_admin/ && Rails.env == "development"
    end
  #### This is just a hack to reload RailsAdmin initialization ####    
  
end
