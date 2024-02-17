# == Schema Information
#
# Table name: medical_conditions
#
#  id         :uuid             not null, primary key
#  code       :string           not null
#  name       :string           not null
#  slug       :string           not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MedicalCondition < ApplicationRecord
  has_paper_trail
  include Statusable
  include Sluggable

  friendly_slug_scope to_slug: :name

  # Associations
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
    self.code = create_code
  end

  def create_code
    if MedicalCondition.count.zero?
      '01'
    else
      last_code = MedicalCondition.last.code
      last_code.next
    end
  end
end
