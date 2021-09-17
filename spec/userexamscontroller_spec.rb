require 'rails_helper'
RSpec.describe UserExamsController, type: :controller do
    fixtures :all
    
    it "should register user" do
        ex = exams(:one)
        student = users(:student)
        params = {:exam=>ex.id, :user => student.id} 
        sign_in student 
        get :create, :params => params
        ue_tst = UserExam.where(:exam_id => ex.id, :user_id => student.id)
        expect(ue_tst).not_to be_empty
    end
end