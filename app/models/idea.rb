class Idea < ActiveRecord::Base
  
  # - Associations -

  has_many :event, inverse_of: :idea
  has_attached_file :image, styles: { medium: "300x300#" }, default_style: :medium
    
  # - Accessors -

  attr_accessor :delete_image
  
  # - Validations -
  
  before_validation { self.image.clear if self.delete_image == '1' }  
  validates :title, presence: true  
  validates :description, presence: true    
  
end
