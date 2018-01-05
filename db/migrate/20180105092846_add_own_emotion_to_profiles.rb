class AddOwnEmotionToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :own_emotion, :integer
  end
end
