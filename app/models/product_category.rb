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
class ProductCategory < ApplicationRecord
  has_paper_trail
  include Statusable
  include Sluggable
  include Searchable

  friendly_slug_scope to_slug: :name
  searchable against: :name

  # Associations
  has_one_attached :image, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_subcategories, dependent: :destroy

  # Callbacks
  before_validation :downcase_name
  before_validation :assign_code

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :code, presence: true, uniqueness: true

  # Scopes

  # Instance Methods
  def downcase_name
    return unless new_record? && name.present?
    self.name = name.downcase
  end

  def assign_code
    self.code = create_code
  end

  def create_code
    if ProductCategory.count.zero?
      '01'
    else
      last_code = ProductCategory.order(:created_at).last.code
      last_code.next
    end
  end
end
