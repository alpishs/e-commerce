class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.decimal :price
      t.integer :make
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
