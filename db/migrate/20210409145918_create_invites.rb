class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :cabal_id
      t.string :invitation_token

      t.timestamps
    end
    add_index :invites, :invitation_token, unique: true
  end
end
