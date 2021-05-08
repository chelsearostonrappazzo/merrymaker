class RemoveUserIdFromCabal < ActiveRecord::Migration[6.1]
  def change
    remove_column :cabals, :user_id
  end
end
