class SectionRole < ActiveRecord::Base

  belongs_to :user
  belongs_to :request
  belongs_to :section
end
