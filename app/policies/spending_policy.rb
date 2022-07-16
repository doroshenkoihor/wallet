class SpendingPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.present?
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    @user.present?
  end

  def edit
    @user.present?
  end

  def destroy?
    true
  end
end
