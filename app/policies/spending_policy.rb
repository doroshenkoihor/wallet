class SpendingPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.present?
  end

  def show?
    is_owner?
  end

  def create?
    @user.present?
  end

  def update?
    is_owner?
  end

  def edit
    update?
  end

  def destroy?
    is_owner?
  end
end
