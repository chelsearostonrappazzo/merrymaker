class RemoveUserIdFromCabals < ActiveRecord::Migration[6.1]
  def changer
    remove_column :cabals, :user_id
  end
end
