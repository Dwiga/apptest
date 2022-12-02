class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :content_name
      t.string :isbn
      t.string :original_title
      t.integer :year
      t.string :author_name
      t.string :language_code
      t.string :category
      t.text :plot
      t.string :copyright
      t.string :title
      t.float :average_rating
      t.integer :rating_count
      t.text :description
      t.string :loc_class
      t.integer :pages
      t.string :language
      t.string :isbn13
      t.string :countries
      t.datetime :release_date
      t.string :cover
      t.text :summary
      t.boolean :content_cleaned
      t.boolean :content_available
      t.integer :n_authors
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
