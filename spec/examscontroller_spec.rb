require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  fixtures :all
  before(:all) do
    Exam.all.each do |ex|
      ex.destroy
    end
  end
  it "Should give me exams from fixtures" do
    student = users(:student)
    sign_in student
    get :index
    expect(assigns(:exams).size).to eql(1)
  end
  it "Should retrieve exams" do
    ex = exams(:one)
    params = {:id => ex.id}
    student = users(:student)
    sign_in student
    get :show, :params => params
    expect(assigns(:exam)).to eql(ex)
  end
  it "should  create exam" do
    params = {:exam=>{:name => "Name", :code => "Code", :description => "Description" }}
    
    professor = users(:professor)
    sign_in professor

    
    get :create, :params => params
    e_tst = Exam.where(:name => "Name")
    expect(e_tst).not_to be_empty
  end
  /
  it "should not create exam" do
    params = {:exam=>{:name => "Name", :code => "Code", :description => "Description" }}
    
    student = users(:student)
    sign_in student

    
    get :create, :params => params
    e_tst = Exam.where(:name => "Name").first
    expect(e_tst).to be_empty
  end*/
  it "should update exam" do
    ex = exams(:one)
    params = {:id => ex.id, :exam=>{:name => "Name"}}
    
    professor = users(:professor)
    sign_in professor
    
    
    get :update, :params => params
    e_tst = Exam.find(ex.id)
    expect(e_tst.name).to eql("Name")
  end
  it "should destroy exams" do
    ex = exams(:one)
    params = {:id => ex.id}

    professor = users(:professor)
    sign_in professor

    get :destroy, :params => params
    e_tst = Exam.where(:id => ex.id)
    expect(e_tst).to be_empty
  end
end