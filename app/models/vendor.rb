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
class Vendor < ApplicationRecord
  has_paper_trail
  include Statusable
  include Sluggable

  friendly_slug_scope to_slug: :name

  # Associations
  has_many :products, dependent: :destroy
  has_many :prices, as: :item, dependent: :destroy

  # Callbacks
  before_validation :downcase_name

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Scopes

  # Instance Methods
  def downcase_name
    return unless new_record? && name.present?
    self.name = name.downcase
  end
end
