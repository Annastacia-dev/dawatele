# == Schema Information
#
# Table name: products
#
#  id                     :uuid             not null, primary key
#  code                   :string           not null
#  description            :text             not null
#  metadata               :jsonb            not null
#  name                   :string           not null
#  sku                    :string           not null
#  slug                   :string           not null
#  status                 :integer          default("active"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  brand_id               :uuid             not null
#  medical_condition_id   :uuid
#  product_category_id    :uuid             not null
#  product_subcategory_id :uuid
#
# Indexes
#
#  index_products_on_brand_id                (brand_id)
#  index_products_on_medical_condition_id    (medical_condition_id)
#  index_products_on_product_category_id     (product_category_id)
#  index_products_on_product_subcategory_id  (product_subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (medical_condition_id => medical_conditions.id)
#  fk_rails_...  (product_category_id => product_categories.id)
#  fk_rails_...  (product_subcategory_id => product_subcategories.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
