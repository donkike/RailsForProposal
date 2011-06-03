class SectionRole < ActiveRecord::Base

  belongs_to :user
  belongs_to :request_section
  
  scope :pending, where(:status => "pending")
  
  def rate(rates)
    count = 0
    rates.each do |k, v|
      section_item = SectionItem.find(k)
      self.average += (section_item.value * v.to_f)
      count += section_item.value
    end
    self.average /= count
    self.status = 'rated'
  end
  
end
