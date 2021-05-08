class AddUserIdToCabals < ActiveRecord::Migration[6.1]
  def change
    add_column :cabals, :user_id, :integer
  end
end
