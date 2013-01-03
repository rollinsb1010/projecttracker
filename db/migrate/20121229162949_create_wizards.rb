class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|
      t.integer :project_id
      t.boolean :step_one_complete
      t.integer :step_one_weight
      t.boolean :step_two_complete
      t.integer :step_two_weight
      t.boolean :step_three_complete
      t.integer :step_three_weight
      t.integer :progress
      t.timestamps
    end
  end
end
