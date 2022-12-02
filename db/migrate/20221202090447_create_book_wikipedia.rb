class CreateBookWikipedia < ActiveRecord::Migration[7.0]
  def change
    create_table :book_wikipedia do |t|
      t.string :url
      t.boolean :found
      t.integer :year
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
