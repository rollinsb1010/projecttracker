class CreateSmurves < ActiveRecord::Migration
  def change
    create_table :smurves do |t|

      t.timestamps
    end
  end
end
