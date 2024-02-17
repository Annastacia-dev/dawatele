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
class ProductSubcategory < ApplicationRecord
  has_paper_trail
  include Statusable
  include Sluggable

  friendly_slug_scope to_slug: :name

  # Associations
  has_one_attached :image, dependent: :destroy
  belongs_to :product_category
  has_many :products, dependent: :destroy

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
    if ProductSubCategory.count.zero?
      '01'
    else
      last_code = ProductSubCategory.order(:created_at).last.code
      last_code.next
    end
  end

end
