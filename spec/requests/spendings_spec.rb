require 'rails_helper'

RSpec.describe "Spendings", type: :request do
  let(:user) do
    User.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222'
    )
  end

  let(:spending) do
    Spending.create(
      category: "traveling",
      amount: 20,
      description: "Some text",
      user: user
    )
  end

  let(:params) do
    { spending: {
        category: "cafes",
        amount: 30,
        description: "New params"
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)
  end

  describe "GET /spendings_path for user" do
    it "should show all spendings" do
      get spendings_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /spendings" do
    it "should create new spending" do
      post spendings_path, params: params
      expect(response).to redirect_to(spendings_path)
    end
  end

  describe "PUT /spending/:id " do
    it "should update spending" do
      put spending_path(spending), params: params.merge(id: spending.id)
      expect(response).to redirect_to(spendings_path)
    end
  end

  describe "DELETE /spendings/:id " do
    it "should destroy spending" do
      delete spending_path(spending.id)
      expect(response).to redirect_to(spendings_path)
    end
  end
end
