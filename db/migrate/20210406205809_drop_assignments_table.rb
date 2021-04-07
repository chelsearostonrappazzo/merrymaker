class DropAssignmentsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :assignments
  end
end
