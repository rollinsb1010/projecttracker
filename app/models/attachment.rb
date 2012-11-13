class Attachment < ActiveRecord::Base
  attr_accessible :attachment_url, :file_size, :file_name, :file_type
end
