# == Schema Information
#
# Table name: product_categories
#
#  id          :uuid             not null, primary key
#  code        :string           not null
#  description :text             not null
#  name        :string           not null
#  slug        :string           not null
#  status      :integer          default("active"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ProductCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
