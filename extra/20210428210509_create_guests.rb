class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.integer :user_id
      t.integer :celebration_id

      t.timestamps
    end
  end
end
