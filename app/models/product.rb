# == Schema Information
#
# Table name: products
#
#  id                     :uuid             not null, primary key
#  description            :text             not null
#  metadata               :jsonb            not null
#  name                   :string           not null
#  sku                    :string           not null
#  slug                   :string           not null
#  status                 :integer          default(0), not null
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
class Product < ApplicationRecord
  has_paper_trail
  include Statusable
  include Sluggable

  friendly_slug_scope to_slug: :name

  # Associations
  belongs_to :brand
  belongs_to :product_category
  belongs_to :product_sub_category, optional: true
  belongs_to :medical_condition, optional: true
  has_many :product_items, dependent: :destroy
  has_many :prices, as: :item, dependent: :destroy
  has_many_attached :images

    # Callbacks
    before_validation :downcase_name
    before_validation :assign_sku

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :sku, presence: true, uniqueness: true

  # Scopes

  # Instance Methods
  def downcase_name
    return unless new_record? && name.present?
    self.name = name.downcase
  end

  def assign_sku
    self.sku = create_sku
  end

  def create_sku
    product_code = create_number
    "#{brand.code}#{product_category.code}#{product_sub_category&.code}#{medical_condition&.code}#{product_code}"
  end


  def create_number
    if Product.count.zero?
      '01'
    else
      last_sku = Product.order(:created_at).last.sku
      last_sku.next
    end
  end
end
