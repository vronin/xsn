class Idea < ActiveRecord::Base
  has_many :event, :inverse_of => :idea
  
  has_attached_file :image, :styles => { :medium => "300x300#" }, :default_style => :medium
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }
  
  validates :title, presence: true  
  validates :description, presence: true    
end
