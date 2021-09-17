require 'rails_helper'

RSpec.describe Project, type: :model do
  User.delete_all
  Project.delete_all


  describe "Create Project" do
    it "should be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      u1.save!
      e1 = Exam.create!(:id=>10 , :name=> "LTW", :code=>"1234")
      e1.save!
      p1 = Project.new(:id=> 1, :project_name=> "Prog Lab", :repo=>"prova/repo", :description=>"Prog per esame Lab", :user_id=> 1,:exam_ids=>[10])
      p1.save!
      exPro= ExamProject.create!(:project_id=>1 , :exam_id=> 10)
      exPro.save!
      
      expect(p1).to be_valid
    end

  end

  describe "Create Project without a name"do
    it "should not be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      e1 = Exam.create!(:id=>10 , :name=> "LTW", :code=>"1234")
      p1 = Project.new(:id=> 1, :repo=>"prova/repo", :description=>"Prog per esame Lab", :user_id=> 1,:exam_ids=>[10])
      expect(p1).not_to be_valid
    end
  end

  describe "Create Project without an Exam to who it belongs"do
    it "should not be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      p1 = Project.new(:id=> 1,:project_name=> "Prog Lab", :repo=>"prova/repo", :description=>"Prog per esame Lab", :user_id=> 1)
      expect(p1).not_to be_valid
    end
  end

  describe "Create Project without a user who creates it"do
    it "should not be permitted" do
      e1 = Exam.create!(:id=>10 , :name=> "LTW", :code=>"1234")
      p1 = Project.new(:id=> 1,:project_name=> "Prog Lab", :repo=>"prova/repo", :description=>"Prog per esame Lab", :exam_ids=>[10])
      expect(p1).not_to be_valid
    end
  end

  describe "Create Project without a repo"do
    it "should be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      e1 = Exam.create!(:id=>10 , :name=> "LTW", :code=>"1234")
      p1 = Project.new(:id=> 1,:project_name=> "Prog Lab", :description=>"Prog per esame Lab", :user_id=> 1,:exam_ids=>[10])
      expect(p1).to be_valid
    end
  end

  describe "Create Project without a description"do
    it "should be permitted" do
      u1 = User.create!(:id=>1,:email=>"utenteprova@groupedprova.com", 
        :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1)
      e1 = Exam.create!(:id=>10 , :name=> "LTW", :code=>"1234")
      p1 = Project.new(:id=> 1,:project_name=> "Prog Lab", :repo=>"prova/repo", :user_id=> 1,:exam_ids=>[10])
      expect(p1).to be_valid
    end
  end
end
