class StudentExamsController < ApplicationController
    def create
        exam = Exam.find(params[:exam])
        @student_exam = StudentExam.create(student: current_student, exam: exam)
        flash[:notice] = "#{exam.name} added"
        redirect_to exams_path
    end
    def destroy
        if can_destroy_exam?(params[:id])
            student_exam = StudentExam.where(student: current_student, exam_id: params[:id]).first
            student_exam.destroy
            flash[:notice] = "Exam removed"
            redirect_to exams_path
        else
            flash[:alert] = "You cant remove exam if you have project for that"
            redirect_to exams_path
        end

    end
    private
        def can_destroy_exam?(exam)
            current_student.projects.each do |project|
                p = Project.find(project.id)
                if p.exams.exists?(exam)
                    return false
                end
            end
            true
        end
end