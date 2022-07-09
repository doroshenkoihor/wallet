class SpendingsController < ApplicationController

  def index
    @spendings = Spending.all
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new spending_params

    if @spending.save
      redirect_to root_path
    else
      render spendings_new_path
    end
  end

  def update
    if @spending.update spending_params
      redirect_to root_path
    else
      render spendings_id_path
    end
  end

  def show
  end

  def edit
    @spending = Spending.new
  end

  def destroy
    @spending.destroy
    redirect_to root_path
  end

  private

  def spending_params
    params.require(:spending).permit(:category, :description, :amount)
  end
end
