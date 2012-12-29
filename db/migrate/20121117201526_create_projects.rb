class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :project_name
      t.date :due_date
      t.string :components
      t.string :notes
      t.string :client_name
      t.string :project_manager_assigned
      t.string :account_manager_assigned
      t.string :medium
      t.string :complete
      t.string :description
      t.timestamps
    end
  end
end
