class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.integer :amount_bracket
    end
  end
end
