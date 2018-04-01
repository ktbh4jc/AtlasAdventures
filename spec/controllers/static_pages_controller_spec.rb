require 'rails_helper'

RSpec.describe 'Static Pages', type: :controller do
  describe 'GET Home' do
    subject { page }
    before { visit root_path }
    it { should have_http_status(200) }
    it { should have_content('Welcome to Atlas Adventures!') }
    it { should have_title('Atlas Adventures') }
  end

  describe 'GET Help' do
    subject { page }
    before { visit help_path }
    it { should have_http_status(200) }
    it { should have_content('Welcome to the help page!') }
    it { should have_title('Help') }
  end

  describe 'GET About' do
    subject { page }
    before { visit about_path }
    it { should have_http_status(200) }
    it { should have_content('About Atlas Adventures') }
    it { should have_title('About') }
  end

  describe 'GET Contact' do
    subject { page }
    before { visit contact_path }
    it { should have_http_status(200) }
    it { should have_content('Contact Us') }
    it { should have_title('Contact') }
  end
end