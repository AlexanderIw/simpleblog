require 'rails_helper'
RSpec.describe User, type: :model do 
  before do
    @user = User.new(name: "ExampleUser", email: "ExampleUser@me.com",user_level:1, password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:user_level) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }  #it "should be valid" do expect(@user).to be_valid end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @user.email = "a" * 81 }
    it { should_not be_valid }
  end

  describe "password should have a minimum length" do
    before {@user.password ="a"*5}
    it{should_not be_valid}
  end 
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is available" do
    before do
      @newUser = User.new(name: "ExampleUser1", email: "eUser1@example.com",
                          password: "foobar", password_confirmation: "foobar") 
    end
    it { expect(@newUser).to be_valid }
  end

  describe "when email address is already taken" do
    before do
      @newUser = @user.dup
      @user.save
    end
    it { expect(@newUser).to_not be_valid } 
  end
  
  describe "when password is not present" do
    before {@user = User.new(name: "ExampleUser", email: "user1@example.com", password: "  ", password_confirmation: "  ") }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "mismatch"}
    it { expect(@user.password).not_to eq(@user.password_confirmation) }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }
   
    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      #specify { user_for_invalid_password.should be false }
      specify { expect(user_for_invalid_password).to be false }

    end

    describe "authenticated? should return false for a user with nil digest" do
      it {expect(@user.authenticated?("")).to be false}
    end

    
  end

end