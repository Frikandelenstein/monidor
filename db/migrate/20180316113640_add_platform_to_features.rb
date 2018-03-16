class AddPlatformToFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :platform, :string
  end
end
