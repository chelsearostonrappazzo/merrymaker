class CreateCelebrations < ActiveRecord::Migration[6.1]
  def change
    create_table :celebrations do |t|
      t.string :name
      t.string :type
      t.string :theme
      t.string :colors
      t.string :signature_drink
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
