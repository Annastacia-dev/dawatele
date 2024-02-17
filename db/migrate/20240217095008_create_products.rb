class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.string :slug, null: false
      t.integer :status, null: false, default: 0
      t.jsonb :metadata, null: false, default: {}
      t.references :brand, null: false, foreign_key: true, type: :uuid
      t.references :product_category, null: false, foreign_key: true, type: :uuid
      t.references :product_subcategory, foreign_key: true, type: :uuid
      t.references :medical_condition, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
