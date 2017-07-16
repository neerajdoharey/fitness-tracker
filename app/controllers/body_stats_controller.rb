class BodyStatsController < ApplicationController
  def index
    @body_stats = current_user.body_stats.order('created_at DESC').paginate(page: params[:page], per_page: 10)
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

  def show
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

  def add_weight
    last_stat = current_user.body_stats.last
    if last_stat  == nil
      body_stat = BodyStat.new(:body_fat => 0,:weight => params[:body][:weight].to_f, :height => 0, :waist => 0, :chest => 0, :arms => 0, :forearms => 0, :hips => 0, :neck => 0, :shoulders => 0, :thighs => 0, :calves => 0)
    else
      body_stat = BodyStat.new(:body_fat => last_stat.body_fat,:weight => params[:body][:weight].to_f, :height => last_stat.height, :waist => last_stat.waist, :chest => last_stat.chest, :arms => last_stat.arms, :forearms => last_stat.forearms, :hips => last_stat.hips, :neck => last_stat.neck, :shoulders => last_stat.shoulders, :thighs => last_stat.thighs, :calves => last_stat.calves)
    end
    body_stat.user = current_user
    if body_stat.save
      flash[:success] = "Body Weight added Successfully"
      redirect_to root_path
    else
      flash[:danger] = "Body weight is not valid should be number"
      redirect_to root_path
    end

  end

  def add_bodyfat
    last_stat = current_user.body_stats.last
    if last_stat  == nil
      body_stat = BodyStat.new(:body_fat => params[:body][:bodyfat].to_f,:weight => 0, :height => 0, :waist => 0, :chest => 0, :arms => 0, :forearms => 0, :hips => 0, :neck => 0, :shoulders => 0, :thighs => 0, :calves => 0)
    else
      body_stat = BodyStat.new(:body_fat => params[:body][:bodyfat].to_f ,:weight => last_stat.weight, :height => last_stat.height, :waist => last_stat.waist, :chest => last_stat.chest, :arms => last_stat.arms, :forearms => last_stat.forearms, :hips => last_stat.hips, :neck => last_stat.neck, :shoulders => last_stat.shoulders, :thighs => last_stat.thighs, :calves => last_stat.calves)
    end
    body_stat.user = current_user
    if body_stat.save
      flash[:success] = "Body bodyfat added Successfully"
      redirect_to root_path
    else
      flash[:danger] = "Body bodyfat is not valid should be number"
      redirect_to root_path
    end

  end

  private
  def body_stat_params
    params.require(:body_stat).permit(:body_fat,:weight, :height, :waist, :chest, :arms, :forearms, :hips, :neck, :shoulders, :thighs, :calves)
  end

  # def body_part_stat_params(body_fat, weight, height, waist, chest, arms, forearms, hips, neck, shoulders, thighs, calves , last_stat = nil)
  #   if last_stat == nil
  #     return :body_fat => body_fat,:weight => weight, :height => height, :waist => waist, :chest => chest, :arms => arms, :forearms => forearms, :hips => hips, :neck => neck, :shoulders => shoulders, :thighs => thighs, :calves => calves
  #   else
  #
  #   end
  # end
end
