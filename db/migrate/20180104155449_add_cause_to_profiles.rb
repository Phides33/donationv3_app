class AddCauseToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cause, :integer
  end
end
