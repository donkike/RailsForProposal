class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email

  has_many :section_roles
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
