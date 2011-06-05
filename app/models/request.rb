class Request < ActiveRecord::Base
  attr_accessible :name, :start_date, :decision_date, :company, :comment, :filename, :response_time, :status, :average, :file_upload
  
  attr_accessor :file_upload

  validates :name, :uniqueness => true

  has_many :request_sections, :dependent => :destroy
  has_many :sections, :through => :request_sections
  has_many :section_roles, :through => :request_sections
  
  before_save :save_file
  
  def section(id)
    self.request_sections.find_by_section_id(id)
  end
  
  def users    
    User.where(:id => self.section_roles.inject([]){ |a, s| a << s.user_id} )
  end
  
  def save_file
    return unless self.file_upload
    self.filename = self.file_upload.original_filename
    directory = "public/upload/rfp"
    path = File.join(directory, self.filename)
    File.open(path, "wb") { |f| f.write(self.file_upload.read) }
  end
  
  def update_average
    sum = 0.0
    for section in self.request_sections
      sum += section.average if section.average > 0.0
    end    
    self.average = sum / self.request_sections.count
    save
  end
  
end
