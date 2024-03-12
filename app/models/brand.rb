# == Schema Information
#
# Table name: brands
#
#  id         :uuid             not null, primary key
#  code       :string           not null
#  name       :string           not null
#  slug       :string           not null
#  status     :integer          default("active"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Brand < ApplicationRecord
  has_paper_trail

  include Statusable
  include Sluggable
  include Searchable

  friendly_slug_scope to_slug: :name
  searchable against: :name

  # Associations
  has_one_attached :logo
  has_many :products, dependent: :destroy

  # Callbacks
  before_validation :downcase_name
  before_validation :assign_code

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :code, presence: true, uniqueness: true

  # Scopes

  # Instance Methods
  def downcase_name
    return unless new_record? && name.present?
    self.name = name.downcase
  end

  def assign_code
    code = create_code
    self.code = code
  end

  def create_code
    if Brand.count.zero?
      '01'
    else
      last_code = Brand.order(:created_at).last.code
      last_code.next
    end
  end
end
