class CreateCabals < ActiveRecord::Migration[6.1]
  def change
    create_table :cabals do |t|
      t.string :name
      t.integer :celebration_id
      t.integer :user_id

      t.timestamps
    end
  end
end
