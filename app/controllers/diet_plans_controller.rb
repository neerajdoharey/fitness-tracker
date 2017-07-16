class DietPlansController < ApplicationController
  # layout "print_pdf", :only => [:show]

  def index
    @diet_plans = current_user.diet_plans.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @diet_plan = DietPlan.new
  end

  def create
    @diet_plan = DietPlan.new(diet_plan_params)
    @diet_plan.user = current_user
    if @diet_plan.save
      flash[:success] = "Diet Plan was Successfully created..."
      redirect_to diet_plans_path
    else
      render 'new'
    end
  end

  def edit
    @diet_plan = DietPlan.find(params[:id])
  end

  def show
    @diet_plan = DietPlan.find(params[:id])
  end
  def update
    @diet_plan = DietPlan.find(params[:id])
    if @diet_plan.update(diet_plan_params)
      flash[:success] = "Diet Plan was Successfully updated..."
      redirect_to diet_plans_path
    else
      render 'edit'
    end
  end

  def destroy
    @diet_plan = DietPlan.find(params[:id])
    @diet_plan.destroy
    flash[:danger] = "Diet Plan was Successfully Deleted..."
    redirect_to diet_plans_path
  end
  private
  def diet_plan_params
    params.require(:diet_plan).permit(:title,:diet_description)
  end
end
