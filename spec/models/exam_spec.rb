require 'rails_helper'

RSpec.describe Exam, type: :model do
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
end
