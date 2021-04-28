class AddColorToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :color, :string
  end
end
