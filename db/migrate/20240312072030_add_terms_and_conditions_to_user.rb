class AddTermsAndConditionsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :terms_and_conditions_and_privacy_policy, :boolean, default: false
  end
end
