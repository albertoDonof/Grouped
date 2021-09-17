require 'rails_helper'

RSpec.describe Exam, type: :model do
  Exam.destroy_all

  describe "Create Exam" do
    it "should be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      u1.save!
      e1= Exam.create!(:id=>1 , :name=> "LTW", :code=>"1234")
      e1.save!
      expect(e1).to be_valid
    end
  end

  describe "Create Exam without a name" do
    it "should not be permitted" do
      e1 = Exam.new(:id=>1, :code=>"12345")
      expect(e1).not_to be_valid
    end

  end

  describe "Create Exam without a code" do
    it "should not be permitted" do
      e1 = Exam.new(:id=>1, :name=>"LTW")
      expect(e1).not_to be_valid
    end
  end

  describe "Create Exam without a description" do
    it "should be permitted" do
      e1 = Exam.new(:id=>1, :name=>"LTW", :code=> "11223")
      expect(e1).to be_valid
    end
  end
end