class SpendingsController < ApplicationController
  before_action :require_authentication

  def index
    @spendings = current_user.spendings
    @spendings = @spendings.where(category: params[:category]) if params[:category].present?
    @spendings = @spendings.where(amount: params[:amount_from]..) if params[:amount_from].present?
    @spendings = @spendings.where('amount <= ?', params[:amount_to].to_f) if params[:amount_to].present?
    @spendings = @spendings.where("description like ?", "%#{params[:description]}%") if params[:description].present?
    @total = @spendings.sum(:amount)
    @share_link = share_spendings_url(user_id: current_user.id)
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
    @categories = Spending.categories.keys
  end

  def edit
    @spending = Spending.find(params[:id])
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
end
