class Request < ActiveRecord::Base
  attr_accessible :name, :start_date, :decision_date, :company, :comment, :filename, :response_time, :status, :average
end
