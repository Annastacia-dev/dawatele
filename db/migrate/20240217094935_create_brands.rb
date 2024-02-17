class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :code, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
