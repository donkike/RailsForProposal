class RequestSection < ActiveRecord::Base
  attr_accessible :section_id, :request_id, :comment
  
  belongs_to :request
  belongs_to :section
  has_many :section_roles, :dependent => :destroy
  has_many :section_items, :dependent => :destroy
  
  def update_average
    sum = 0.0
    for role in self.section_roles.not_pending
      sum += role.average
    end
    self.average = sum / self.section_roles.not_pending.count
    self.save
    self.request.update_average
  end
  
  def finished
    self.section_roles.pending.empty?
  end
  
end
