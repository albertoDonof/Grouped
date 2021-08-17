class StudentExamsController < ApplicationController
    def create
        exam = Exam.find(params[:exam])
        @student_exam = StudentExam.create(student: current_student, exam: exam)
        flash[:notice] = "#{exam.name} added"
        redirect_to exams_path
    end
    
end