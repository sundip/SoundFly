require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'SoundFly'" do
      visit '/static_pages/home'
      page.should have_content('SoundFly')
    end
    
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "SoundFly | Home")
    end
  end
  
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
    
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "SoundFly | About Us")
    end
  end
  
end