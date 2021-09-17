require 'rails_helper'
RSpec.describe ProjectsController, type: :controller do
    fixtures :all
    
    it "Should retrieve projects" do
        pr = projects(:one)
        params = {:id => pr.id}
        student = users(:student)
        sign_in student
        get :show, :params => params
        expect(assigns(:project)).to eql(pr)
    end
    it "should destroy projects" do
        pr = exams(:one)
        params = {:project => pr.id}
    
        pr_mng = users(:project_manager)
        sign_in pr_mng
    
        get :destroy, :params => params
        pr_tst = Project.where(:id => pr.id)
        expect(e_tst).to be_empty
    end
   
end