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
   / it "Should update projects" do
        pr = projects(:one)
        params = {:id => pr.id, :project=>{:project_name=>"NomeProva"}}
        prg_mng = users(:project_manager)
        sign_in prg_mng
        get :update, :params => params
        pr_tst = Project.find(pr.id)
        expect(pr_tst.project_name).to eql("NomeProva")
    end */
    it "Should not update projects" do
        pr = projects(:one)
        params = {:id => pr.id, :project=>{:project_name=>"NomeProva"}}
        student = users(:student)
        sign_in student
        get :update, :params => params
        pr_tst = Project.find(pr.id)
        expect(pr_tst.project_name).to eql(pr.project_name)
    end
   
end