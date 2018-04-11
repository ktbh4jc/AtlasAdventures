# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SiteLayouts', type: :request do
  describe 'GET root home' do
    subject { page }
    before { visit root_url }

    # Header
    it { should have_link('Help', href: help_path) }
    it { should have_link('Home', href: root_url) }
    it { should have_link('Log in', href: '#') }

    # Footer
    it { should have_link('About', href: about_path) }
    it { should have_link('Contact', href: contact_path) }
  end
end
