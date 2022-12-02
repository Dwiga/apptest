class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.text :bio
      t.string :name
      t.string :countries
      t.string :gender
      t.integer :n_books
      t.text :summary
      t.datetime :born
      t.datetime :died

      t.timestamps
    end
  end
end
