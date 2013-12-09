class User < ActiveRecord::Base  
  
  # - Associations
  
  # - Accessors
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # - Validations

  # Add roles to users model for further authentication by cancan
  AVALIABLE_ROLES = %w(user researcher manager admin)
  validates :role, presence: true, inclusion: { in: AVALIABLE_ROLES }
  
end
