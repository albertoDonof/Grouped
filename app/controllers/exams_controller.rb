class ExamsController < ApplicationController
    def index
        @exams = Exam.all
    end
    def show
        @exam = Exam.find(params[:id])
    end
    def new
        @project = Project.new
    end
    def create
    end

end