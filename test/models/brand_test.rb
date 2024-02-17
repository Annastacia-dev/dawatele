# == Schema Information
#
# Table name: brands
#
#  id         :uuid             not null, primary key
#  code       :string           not null
#  name       :string           not null
#  slug       :string           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
