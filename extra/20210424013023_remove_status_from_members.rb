class RemoveStatusFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :status
  end
end
