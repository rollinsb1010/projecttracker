class Attachment < ActiveRecord::Base
  attr_accessible :attachment_id, :attachment_url, :file_size, :file_name, :file_type
  
   belongs_to :project
end
