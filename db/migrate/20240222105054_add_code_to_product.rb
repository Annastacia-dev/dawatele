class AddCodeToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :code, :string, null: false
  end
end
