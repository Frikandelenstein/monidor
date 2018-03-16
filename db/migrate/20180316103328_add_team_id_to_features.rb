class AddTeamIdToFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :team_id, :integer
  end
end
