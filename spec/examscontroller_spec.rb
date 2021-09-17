require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  fixtures :all
  before(:all) do
    Exam.all.each do |ex|
      ex.destroy
    end
  end
  context "user student" do
    before :each do
      student = users(:student)
      sign_in student
    end
    it "Should give me exams from fixtures" do
      get :index
      expect(assigns(:exams).size).to eql(1)
    end
    it "Should retrieve exams" do
      ex = exams(:one)
      params = {:id => ex.id}
      get :show, :params => params
      expect(assigns(:exam)).to eql(ex)
    end

    it "should not destroy exams" do
      ex = exams(:one)
      params = {:id => ex.id}
      get :destroy, :params => params
      e_tst = Exam.where(:id => ex.id)
      expect(e_tst).not_to be_empty
    end
    it "should not create exam" do
      params = {:exam=>{:name => "Name", :code => "Code", :description => "Description" }}
      get :create, :params => params
      e_tst = Exam.where(:name => "Name")
      expect(e_tst).to be_empty
    end
    it "should not update exam" do
      ex = exams(:one)
      params = {:id => ex.id, :exam=>{:name => "Name"}}
      get :update, :params => params
      e_tst = Exam.find(ex.id)
      expect(e_tst.name).not_to eql("Name")
    end
  end
  context "user professor" do
    before :each do
      professor = users(:professor)
      sign_in professor
    end
    it "should  create exam" do
      params = {:exam=>{:name => "Name", :code => "Code", :description => "Description" }}  
      get :create, :params => params
      e_tst = Exam.where(:name => "Name")
      expect(e_tst).not_to be_empty
    end
    
    it "should update exam" do
      ex = exams(:one)
      params = {:id => ex.id, :exam=>{:name => "Name"}}
      get :update, :params => params
      e_tst = Exam.find(ex.id)
      expect(e_tst.name).to eql("Name")
    end
    it "should destroy exams" do
      ex = exams(:one)
      params = {:id => ex.id}
      get :destroy, :params => params
      e_tst = Exam.where(:id => ex.id)
      expect(e_tst).to be_empty
    end
  end
end