class CreateWikipedia < ActiveRecord::Migration[7.0]
  def change
    create_table :wikipedia do |t|
      t.string :url
      t.boolean :found
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
