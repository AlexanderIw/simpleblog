require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "Authentication" do
    
      subject { page }
      
      describe "login page" do
        before { visit login_path }
        let(:user) { FactoryGirl.create(:user) }


        describe "with no information entered" do
          it { should have_content('Log in') }
          it { should have_title('Log in') }
        end

        describe "with invalid information" do
          before do
            fill_in "Email",    with: "foobar"
            fill_in "Password", with: "foobar"
            click_button "Log in"
          end
    
          it { should have_selector('div.alert.alert-danger') } 

          it { should_not have_title(user.name) }
          it { should_not have_link('Profile',     href: user_path(user)) }

        end

        describe "with valid information" do
          before do
            fill_in "Email",    with: user.email.upcase
            fill_in "Password", with: user.password
            click_button "Log in"
          end

          it { should have_title(user.name) }
          it { should have_link('Profile',     href: user_path(user)) }
          it { should have_link('Menu',        href: menu_path) }
          it { should_not have_link('Log in',  href: login_path) }
        end

        describe "with a successful login out" do 
          before do
            fill_in "Email",    with: user.email.upcase
            fill_in "Password", with: user.password
            click_button "Log in"
            click_link "Log out"
          end
          it { should have_title("Home Page") }
          it { should have_link('Log in',  href: login_path) }
        end

      end
  end
end