class SectionRole < ActiveRecord::Base
  
  STATUS = %w[pending accepted rejected]

  belongs_to :user
  belongs_to :request_section
  
  scope :pending, where(:status => "pending")
  scope :accepted, where(:status => "accepted")
  scope :rejected, where(:status => "rejected")
  scope :not_pending, where("status != 'pending'")
  
  def rate(rates)
    count = 0
    rates.each do |k, v|
      section_item = SectionItem.find(k)
      self.average += (section_item.value * v.to_f)
      count += section_item.value
    end
    self.average /= count
    self.status = 'rated'
    self.save
    self.request_section.update_average
  end
  
end
