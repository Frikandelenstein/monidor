class Feature < ApplicationRecord
  belongs_to :team

  def humanize
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if duration > 0
        duration, n = duration.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.join(' ')
  end
end
