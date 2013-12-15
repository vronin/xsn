class WelcomeAuthorizedController < ApplicationController
  def index
    @events = params[:search] ? Event.near(params[:search], 20) : nil
  end
end
