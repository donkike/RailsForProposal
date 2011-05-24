class Request < ActiveRecord::Base
  attr_accessible :name, :start_date, :decision_date, :company, :comment, :filename, :response_time, :status, :average

  has_many :section_roles
  has_many :users, :through => :section_roles
end
