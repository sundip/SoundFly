require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
     before { visit root_path } 

      it { should have_selector('h1', text: 'SoundFly') }
      it { should have_selector 'title',
                          text: "SoundFly" }
      it { should_not have_selector 'title', text: '| Home' }
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

#root_path
#about_path