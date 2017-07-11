class DashboardController < ApplicationController
  before_action :checking_settings

  def index
    @body_stats = current_user.body_stats
    @weights = @body_stats.map &:weight
    @body_fats = @body_stats.map &:body_fat
    @dates = @body_stats.map { |body_stat| body_stat.created_at.strftime('%d %b %Y') }
    @lean_body_mass = lean_body_mass(@body_stats)
    @body_fat = body_fat(@body_stats)
    @bmi = body_mass_index(@body_stats.last)

  end

  private
  def lean_body_mass(body_stats)
    unless body_stats.empty?
      body_stat = latest_stats(body_stats)
      return body_stat.weight - (body_stat.weight * (body_stat.body_fat.to_f/100))
    else
      return nil
    end
  end

  def body_fat(body_stats)
    if !body_stats.empty?
      body_stat = latest_stats(body_stats)
      return (body_stat.weight - @lean_body_mass)
    else
      return nil
    end
  end

  def latest_stats(body_stats)
    return body_stats.last
  end

  def body_mass_index(body_stats)
    if body_stats
      weight = body_stats.weight
      height = body_stats.height
      bmi = (weight/((height/100)**2)).round(2)
      return [bmi , bmi_chart(bmi)]
    else
      return ["-" , "-"]
    end
  end
end
