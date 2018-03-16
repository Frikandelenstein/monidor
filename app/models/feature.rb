class Feature < ApplicationRecord
  belongs_to :team, optional: true

  def humanize
    durr = duration
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if durr > 0
        durr, n = durr.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.join(' ')
  end

  def set_team(teamName)
    teamName.match(/.+?(?=-|_)/)
  end

end
