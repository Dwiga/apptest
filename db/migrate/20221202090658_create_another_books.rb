class CreateAnotherBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :another_books do |t|
      t.string :name

      t.timestamps
    end
  end
end
