class Project < ActiveRecord::Base
   attr_accessible :project_id, :project_name, :due_date, :components, :notes, :client_name, :project_manager_assigned,
       :account_manager_assigned, :medium, :stage, :percentage_complete, :description
end
