class SpendingsController < ApplicationController
  before_action :require_authentication
  #before_action :authorize_spending!

  def index
    @spendings = Spending.all
  end

  def new
    @spending = Spending.new
    @categories = Spending.categories.keys
  end

  def create
    @spending = Spending.new spending_params.merge(user_id: current_user.id)

    if @spending.save
      flash[:success] = "Spending created!"
      redirect_to spendings_path
    else
      render new_spending_path
    end
  end

  def update
    spending = Spending.find(params[:id])

    if spending.update spending_params
      redirect_to spendings_path
    else
      render spendings_id_path
    end
  end

  def show
    @spending = Spending.find(params[:id])
  end

  def edit
    @categories = Spending.categories.keys
  end

  def destroy
    spending = Spending.find(params[:id])
    spending.destroy
    redirect_to spendings_path
  end

  private

  def spending_params
    params.require(:spending).permit(:category, :description, :amount)
  end

  #def authorize_spending!
  #  authorize(@spending || Spending)
  #end
end
