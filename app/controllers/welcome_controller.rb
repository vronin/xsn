class WelcomeController < ApplicationController
  def index
    @random_events = Event.all.sample(3)
  end
end
