class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.string :project_name
      t.datetime :due_date
      t.string :components
      t.string :notes
      t.string :client_name
      t.string :project_manager_assigned
      t.string :account_manager_assigned
      t.string :medium
      t.string :stage
      t.string :percentage_complete
      t.string :description
      t.timestamps
    end
  end
end
