class SectionRole < ActiveRecord::Base

  belongs_to :user
  belongs_to :request_section
  
end
