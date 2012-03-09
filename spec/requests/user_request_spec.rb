#encoding: utf-8
require 'spec_helper'

describe "User Page" do
  subject { page }
  describe "Signup Page" do
    before { visit "/users/sign_up"}
    it{ should have_selector('title', text: '注册')}
  end
    
end
