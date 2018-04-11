# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    subject { page }
    before { visit signup_path }
    it { should have_http_status(:success) }
  end
end
