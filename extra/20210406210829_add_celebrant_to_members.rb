class AddCelebrantToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :celebrant, :boolean, :default => false
  end
end
