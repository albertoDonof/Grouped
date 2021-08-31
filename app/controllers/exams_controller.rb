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
        if exam.save
            flash[:notice] = "Exam created successfully"
            current_user.exams << exam
            redirect_to exams_path
        else
            flash[:alert] = "Something wrong"
            redirect_to 'new'

        end
    end
    def edit
        @exam = Exam.find(params[:id])
    end
    def update
        exam = Exam.find(params[:id])
        if exam.update(params.require(:exam).permit(:name, :code, :description))
            flash[:notice] = "Exam was updated successfully"
            redirect_to exam
        else
            flash[:alert] = "Something wrong"
            render 'edit'
        end
    end

end