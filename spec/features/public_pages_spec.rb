require 'rails_helper'
#Given some context -> when some event occurs -> Then I expect some outcome 
RSpec.describe "Static Pages", type: :request do
  
  describe "Landing Page" do                                         #Given
    before do 
      visit root_path
    end
    
    it "User not login.it should have the content 'ABOUT ME' " do    #when
      expect(page).to have_content('ABOUT ME')                       #Then
    end
    it "should have the subset title 'Home Page' " do            #title is dynamic generated
      expect(page).to have_title("Home Page")  
    end
  end

  describe "Blog Page" do
    before do 
      visit '/blog' #or we can user visit blog_path
    end

    it "should have the content 'RECENT POSTS'" do
      expect(page).to have_content('RECENT POSTS')
    end
    it "should have the subset title 'Blog Page'" do            
      expect(page).to have_title("Blog Page")  
    end
  end

  describe "Project Page" do
    before do
      visit '/projects'
    end

    it "should have the content 'Ruby on Rails Blog'" do
      expect(page).to have_content('Ruby on Rails Blog')
    end
    it "should have the subset title 'Project Page'" do            
      expect(page).to have_title("Project Page")  
    end
  end

  describe "Resume page" do
    before do
      visit '/resume'
    end

    it "should have the content 'Queens College'" do
      expect(page).to have_content('Queens College')
    end
    it "should have the subset title 'Resume Page'" do            
      expect(page).to have_title("Resume Page")  
    end
  end

  describe "Contact page" do
    before do
      visit '/contact'
    end
    
    it "should have the content 'Contact Me'" do
      visit '/contact'
      expect(page).to have_content('Contact Me')
    end
    it "should have the subset title 'Contact Page'" do            
      expect(page).to have_title("Contact Page")  
    end
  end

end
