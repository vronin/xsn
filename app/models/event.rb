class Event < ActiveRecord::Base
  belongs_to :idea, :inverse_of => :event
  
end
