class DashboardController < ApplicationController
  before_action :checking_settings

  def index
    @body_stats = current_user.body_stats
    @weights = @body_stats.map &:weight
    @body_fats = @body_stats.map &:body_fat
    @dates = @body_stats.map { |body_stat| body_stat.created_at.strftime('%d %b %Y') }
    @lean_body_mass = lean_body_mass(@body_stats)
    @body_fat = body_fat(@body_stats)
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
end
