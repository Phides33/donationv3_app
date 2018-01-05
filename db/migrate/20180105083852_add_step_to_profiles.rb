class AddStepToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :step, :integer
  end
end
