require 'rails_helper'

RSpec.describe User, type: :model do
  User.delete_all

  describe "Create User" do
    it "should be permitted" do
      u1 = User.create!(:id=>1 , :email=>"provautente@gmail.com",:password=> "password", :first_name=>"Prova",:last_name=>"Utente",:roles_mask=>1)
      expect(u1).to be_valid
    end
  end

  describe "Create User without first name" do
    it "should not be permitted" do
      u1 = User.new(:id=>1 , :email=>"provautente@gmail.com",:password=> "password",:last_name=>"Utente",:roles_mask=>1)
      expect(u1).not_to be_valid
    end
  end

  describe "Create User without last name" do
    it "should not be permitted" do
      u1 = User.new(:id=>1 , :email=>"provautente@gmail.com",:password=> "password", :first_name=>"Prova",:roles_mask=>1)
      expect(u1).not_to be_valid
    end
  end

  describe "Create User without rolex_mask" do
    it "should be permitted" do
      u1 = User.new(:id=>1 , :email=>"provautente@gmail.com",:password=> "password", :first_name=>"Prova" ,:last_name=>"Utente")
      expect(u1).to be_valid
    end
  end
  
  describe "Create User without password" do
    it "should not be permitted" do
      u1 = User.new(:id=>1 , :email=>"provautente@gmail.com", :first_name=>"Prova",:last_name=>"Utente",:roles_mask=>1)
      expect(u1).not_to be_valid
    end
  end

end
