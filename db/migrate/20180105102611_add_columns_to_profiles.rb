class AddColumnsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :other_emotion, :integer
    add_column :profiles, :preferred_mean, :integer
    add_column :profiles, :money_wish, :string
    add_column :profiles, :age_bracket, :integer
    add_column :profiles, :po_code, :string
    add_column :profiles, :main_mobility_mode, :integer
    add_column :profiles, :motor_vehicle_owner, :boolean
    add_column :profiles, :mobile_number, :string
    add_column :profiles, :email, :string
  end
end
