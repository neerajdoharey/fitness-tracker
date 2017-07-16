module ReportsHelper
  def weight_change_report(current , previous)
    last_weight = current.weight
    second_last_weight = previous.weight
    weight_diff =  last_weight - second_last_weight
    return weight_diff
  end

  def days_diff_report(current , previous)
    days_diff = current.created_at.to_date - previous.created_at.to_date
    return days_diff.to_i
  end
end
