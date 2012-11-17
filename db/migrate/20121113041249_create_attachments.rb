class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :project_id
      t.string :file_name
      t.string :avatar
      t.timestamps
    end
  end
end
