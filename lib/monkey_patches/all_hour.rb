class ActiveSupport::TimeWithZone
  def all_hour
    beginning_of_hour..end_of_hour
  end
end
