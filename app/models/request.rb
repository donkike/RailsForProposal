class Request < ActiveRecord::Base
  attr_accessible :name, :start_date, :decision_date, :company, :comment, :filename, :response_time, :status, :average

  validates :name, :uniqueness => true

  has_many :request_sections
  has_many :sections, :through => :request_sections
  has_many :section_roles, :through => :request_sections
  
  def users    
    User.where(:id => self.section_roles.inject([]){ |a, s| a << s.user_id} )
  end
  
end
