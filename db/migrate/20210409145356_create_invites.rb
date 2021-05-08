class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.integer :cabal_id
      t.integer :user_id
      t.timestamps
    end
  end
end
