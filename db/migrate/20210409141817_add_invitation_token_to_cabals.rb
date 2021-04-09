class AddInvitationTokenToCabals < ActiveRecord::Migration[6.1]
  def change
    add_column :cabals, :invitation_token, :string
    add_index :cabals, :invitation_token, unique: true
  end
end
