class RequestSection < ActiveRecord::Base
  attr_accessible :section_id, :request_id, :comment
  
  belongs_to :request
  belongs_to :section
  has_many :section_roles
  
end
