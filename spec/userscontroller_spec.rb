require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    fixtures :all
    it "Should give me students from fixtures" do
        student = users(:student)
        sign_in student
        get :index
        expect(assigns(:students).size).to eql(2)
    end
    it "Should give me professors from fixtures" do
        student = users(:student)
        sign_in student
        get :index_professors
        expect(assigns(:professors).size).to eql(2)
    end
    it "Should retrieve student" do
        student = users(:student)
        params = {:id => student.id}
        sign_in student
        get :show, :params => params
        expect(assigns(:student)).to eql(student)
    end
    it "Should retrieve professor" do
        professor = users(:professor)
        params = {:id => professor.id}
        student = users(:student)
        sign_in professor
        get :show, :params => params
        expect(assigns(:student)).to eql(professor)
    end

    it "Should destroy user" do
        student = users(:student)
        params = {:id => student.id}
        admin = users(:admin)
        sign_in admin
        get :destroy, :params => params
        u_tst = User.where(:id => student.id)
        expect(u_tst).to be_empty

    end
     
end