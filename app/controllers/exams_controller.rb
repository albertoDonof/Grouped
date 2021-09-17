class ExamsController < ApplicationController
    def index
        @exams = Exam.all
    end
    def show
        @exam = Exam.find(params[:id])
    end
    def new
        @exam = Exam.new
    end
    def create
        exam = Exam.new(params.require(:exam).permit(:name, :code, :description))
        authorize! :create, exam, :message => "You are not authorized"
        if exam.save
            flash[:notice] = "Exam created successfully"
            current_user.exams << exam
            redirect_to exams_path
        else
            flash[:alert] = "Something wrong"
            render 'new'
        end
    end
    def edit
        @exam = Exam.find(params[:id])
    end
    def update
        exam = Exam.find(params[:id])
        authorize! :update, exam, :message => "You are not authorized"

        if exam.update(params.require(:exam).permit(:name, :code, :description))
            flash[:notice] = "Exam was updated successfully"
            redirect_to exam
        else
            flash[:alert] = "Something wrong"
            render 'edit'
        end
    end
    def destroy
        user_exams = UserExam.where(exam_id: params[:id])
        exam_projects = ExamProject.where(exam_id: params[:id])
        exam = Exam.find(params[:id])
        authorize! :destroy, Exam, :message => "You are not authorized"
        user_exams.destroy_all
        exam_projects.destroy_all
        exam.destroy
        redirect_to exams_path
    end

end