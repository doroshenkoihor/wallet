class ShareSpendingsController < ApplicationController
  def index
    @user = User.find(params.required(:user_id))
    @spendings = @user.spendings
    @total = @spendings.sum(:amount)
  end
end
