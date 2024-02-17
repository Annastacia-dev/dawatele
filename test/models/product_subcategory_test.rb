# == Schema Information
#
# Table name: product_subcategories
#
#  id                  :uuid             not null, primary key
#  code                :string           not null
#  description         :text             not null
#  name                :string           not null
#  slug                :string           not null
#  status              :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :uuid             not null
#
# Indexes
#
#  index_product_subcategories_on_product_category_id  (product_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#
require "test_helper"

class ProductSubcategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
