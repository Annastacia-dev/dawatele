class CreateProductSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_subcategories, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :slug, null: false
      t.string :code, null: false
      t.integer :status, null: false, default: 0
      t.references :product_category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
