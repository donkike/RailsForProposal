class Section < ActiveRecord::Base
  
  validates :name, :uniqueness => true
  
end
