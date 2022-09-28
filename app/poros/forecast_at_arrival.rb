class ForecastAtArrival
  attr_reader :conditions, :temperature

  def initialize(whether, time)
    @temperature = temperature(whether, time)
    @conditions = conditions(whether, time)
  end

  def temperature(whether, time)
    if time > 48
      whether[:daily][(time / 24).to_i][:temp][:day]
    else
      whether[:hourly][time][:temp]
    end
  end

  def conditions(whether, time)
    if time > 48
      whether[:daily][(time / 24).to_i][:weather][0][:description]
    else
      whether[:hourly][time][:weather][0][:description]
    end
  end
end
