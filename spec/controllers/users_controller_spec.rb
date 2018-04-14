# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    subject { page }
    before { visit signup_path }
    it { should have_http_status(:success) }
    it { should render_template(:new) }
    end

  describe 'GET #show' do
    subject { page }
    before { @user = FactoryBot.create(:user) }
    before { visit "/users/#{@user[:username]}" }
    it { should have_http_status(:success) }
    it { should render_template(:show) }
  end
end
