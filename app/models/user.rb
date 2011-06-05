class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :first_name, :last_name, :username, :email

  validates :username, :uniqueness => true

  has_many :section_roles, :dependent => :destroy
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
