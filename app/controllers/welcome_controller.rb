class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @random_events = Event.all.sample(3)
  end
end
