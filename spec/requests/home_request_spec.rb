require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe "about us page" do
    before { visit about_us_path}
      it { should have_content('About Us') }
      it { should have_selector('h1',:text => 'About Us')}
      it {should have_selector('title',:text => 'About Us')}
  end

end
