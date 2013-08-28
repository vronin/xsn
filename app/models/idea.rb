class Idea < ActiveRecord::Base
  has_many :event, :inverse_of => :idea
  
  validates :title, presence: true  
  validates :description, presence: true  
end
