class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.date :released_at
      t.references :user, foreign_key: true
      t.references :director, foreign_key: true

      t.timestamps
    end
  end
end
