class Attachment < ActiveRecord::Base
  attr_accessible :file_name, :avatar, :project_id
  
   belongs_to :project
   
   mount_uploader :avatar, AvatarUploader
end
