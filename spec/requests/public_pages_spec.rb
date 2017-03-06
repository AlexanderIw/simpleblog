require 'rails_helper'

RSpec.describe "PublicPages", type: :request do
  
  describe "Home Page" do
    #given: the user not login 
    #when: the user visit the landing page
    it "Then: should have the content 'about me' " do
      visit root_path
      #get public_pages_index_path
      #expect(response).to have_http_status(200)
      expect(page).to have_content('About Me')
    end
  end


end
