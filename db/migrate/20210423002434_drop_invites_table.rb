class DropInvitesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :invites
  end
end
