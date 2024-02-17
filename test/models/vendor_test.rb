# == Schema Information
#
# Table name: vendors
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
