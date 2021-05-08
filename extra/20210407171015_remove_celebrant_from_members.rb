class RemoveCelebrantFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :celebrant
  end
end
