class Event < ActiveRecord::Base
  belongs_to :idea, :inverse_of => :event
  
  validates :location, presence: true  
  validates :idea, presence: true
end
