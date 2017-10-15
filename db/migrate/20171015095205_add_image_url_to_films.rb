class AddImageUrlToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :image_url, :string
  end
end
