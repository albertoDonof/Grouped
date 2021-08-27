class ProjectsController < ApplicationController
    def show
        @project = Project.find(params[:id])
    end
    def new
        @project = Project.new
    end
    def create
        @project = Project.new(params.require(:project).permit(:project_name, :description, exam_ids: []))
        @project.students << current_student
        if @project.save
            flash[:notice] = "Article was created successfully"
            redirect_to @project
        else
            render 'new'
        end
    end
end