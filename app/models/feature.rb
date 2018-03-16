class Feature < ApplicationRecord
  belongs_to :team, optional: true

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

<<<<<<< HEAD
  def set_team(teamName)
    teamName.match(/.+?(?=-|_)/)
  end

=======
  def remove_previous
    previous = Feature.where(name: name)
    previous.delete_all
  end
>>>>>>> 7fb40d7eb978604cc866786e2d4ed2bdb2128dcb
end
