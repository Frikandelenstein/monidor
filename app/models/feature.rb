class Feature < ApplicationRecord
  belongs_to :team, optional: true

  before_save :set_team
  before_save :remove_previous

  def humanize
    durr = duration
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if durr > 0
        durr, n = durr.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.join(' ')
  end

  def set_team
    team_name = name.match(/^[^-|_]*/).to_s
    team_name = "CUOA" if team_name == "COB"
    self.team_id = Team.find_by(code: team_name).id
  end

  def remove_previous
    previous = Feature.where(name: name)
    previous.delete_all
  end
end
