class ReportsController < ApplicationController
  def weight
    if params[:starting_date]
      start_date = params[:starting_date].to_date
      end_date = params[:ending_date].to_date
      @body_weight = current_user.body_stats.where(:created_at => start_date..end_date)
      # @body_weight = current_user.body_stats.where('created_at >= ? AND created_at <= ?', start_date,  end_date)
      @weights = @body_weight.map &:weight
      @dates = @body_weight.map { |body_stat| body_stat.created_at.strftime('%d %b %Y') }
    else
      @body_weight = current_user.body_stats
      @weights = @body_weight.map &:weight
      @dates = @body_weight.map { |body_stat| body_stat.created_at.strftime('%d %b %Y') }

    end
  end

  def bodyfat
  end
end
