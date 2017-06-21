class BodyStatsController < ApplicationController
  def index
    @body_stats = current_user.body_stats.order('created_at DESC').paginate(page: params[:page], per_page: 2)
  end

  def new
    @body_stat = BodyStat.new
    @body_stat_last = current_user.body_stats.last
  end

  def create
    @body_stat = BodyStat.new(body_stat_params)
    @body_stat.user = current_user
    if @body_stat.save
      flash[:success] = "Stat was Successfully created..."
      redirect_to body_stats_path
    else
      render 'new'
    end
  end

  def edit
    @body_stat = BodyStat.find(params[:id])
  end

  def update
    @body_stat = BodyStat.find(params[:id])
    if @body_stat.update(body_stat_params)
      flash[:success] = "Body Stat  was Successfully updated..."
      redirect_to body_stats_path
    else
      render 'edit'
    end
  end

  def destroy
    @body_stat = BodyStat.find(params[:id])
    @body_stat.destroy
    flash[:danger] = "Body Stat was Successfully Deleted..."
    redirect_to body_stats_path
  end

  private
  def body_stat_params
    params.require(:body_stat).permit(:body_fat,:weight, :height, :waist, :chest, :arms, :forearms, :hips, :neck, :shoulders, :thighs, :calves)
  end
end
