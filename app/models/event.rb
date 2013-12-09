class Event < ActiveRecord::Base

  # - Associations -  
  
  belongs_to :idea, inverse_of: :event
  has_attached_file :image, styles: { medium: "300x300#" }, default_style: :medium

  # - Accessors -
  
  attr_accessor :delete_image
  
  # - Validations -  
  
  before_validation { self.image.clear if self.delete_image == '1' }
  before_validation { self.image = idea.image }
  
  validates :location, presence: true  
  validates :idea, presence: true
  validates :title, presence: true  
  
end
