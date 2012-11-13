class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file_type
      t.string :attachment_url
      t.string :file_size
      t.timestamps
    end
  end
end
