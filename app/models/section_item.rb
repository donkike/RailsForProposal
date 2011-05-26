class SectionItem < ActiveRecord::Base
  attr_accessible :request_section_id, :name, :value
  
  belongs_to :request_section
  
end
