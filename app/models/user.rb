# == Schema Information
#
# Table name: users
#
#  id                                      :uuid             not null, primary key
#  confirmation_sent_at                    :datetime
#  confirmation_token                      :string
#  confirmed_at                            :datetime
#  current_sign_in_at                      :datetime
#  current_sign_in_ip                      :string
#  email                                   :string           default(""), not null
#  encrypted_password                      :string           default(""), not null
#  failed_attempts                         :integer          default(0), not null
#  first_name                              :string           not null
#  last_name                               :string           not null
#  last_sign_in_at                         :datetime
#  last_sign_in_ip                         :string
#  locked_at                               :datetime
#  phone_number                            :string           not null
#  remember_created_at                     :datetime
#  reset_password_sent_at                  :datetime
#  reset_password_token                    :string
#  role                                    :integer          default(0)
#  sign_in_count                           :integer          default(0), not null
#  terms_and_conditions_and_privacy_policy :boolean          default(FALSE)
#  unconfirmed_email                       :string
#  unlock_token                            :string
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_paper_trail

  # --- associations ---
  has_one_attached :avatar

  # --- enums ---
  enum role: { customer: 0, admin: 1 }

  # --- validations ---
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :terms_and_conditions_and_privacy_policy, acceptance: true, on: :create

  # --- instance methods ---
  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

  def customer?
    role == 'customer'
  end
end
