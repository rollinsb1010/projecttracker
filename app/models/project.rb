class Project < ActiveRecord::Base
  attr_accessible :project_name, :due_date, :components, :notes, :client_name, :project_manager_assigned,
       :account_manager_assigned, :medium, :percentage_complete, :description, :id
       
   belongs_to :admin 
   has_many :attachments  

end
