class UserExamsController < ApplicationController
    def create
        exam = Exam.find(params[:exam])
        @user_exam = UserExam.create(user: current_user, exam: exam)
        authorize! :create, @user_exam

        current_user.set_student
        flash[:notice] = "#{exam.name} added"
        redirect_to exams_path
    end
    def destroy
        if can_destroy_exam?(params[:id])
                user_exam = UserExam.where(user: current_user, exam_id: params[:id]).first
                authorize! :destroy, UserExam

                user_exam.destroy
                flash[:notice] = "Exam removed"
                redirect_to exams_path
           
        else
            flash[:alert] = "You cant remove exam if you have project for that"
            redirect_to exams_path
            
        end

    end
    private
        def can_destroy_exam?(exam)
            current_user.projects.each do |project|
                p = Project.find(project.id)
                if p.exams.exists?(exam)
                    return false
                end
            end
            true
        end
end