require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) do
    User.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
    password_confirmation: '222',)
  end

  let(:params) do
    { user: {
        name: 'Adam',
        email: 'Adam@email.com',
        password: '111',
        password_confirmation: '111',
    } }
  end

  describe "GET /sign_up" do
    it "works" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "works" do
      post users_path, params: params
      expect(response).to redirect_to(spendings_path)
    end
  end
end
