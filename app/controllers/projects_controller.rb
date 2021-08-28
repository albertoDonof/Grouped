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
            if can_create_project?(params[:project][:exam_ids])
                flash[:notice] = "Projec was created successfully"
                current_student.set_project_manager
                redirect_to project_path(@project)
            else
                flash[:alert] = "You have to subscibe to exams for create projects"
                render 'new'
            end
        else
            flash[:alert] = "Something wrong"
            render 'new'
        end
    end

    private
        def can_create_project?(ids)
            ids.drop(1).each do |id|
                if !current_student.exams.exists?(id)
                    return false
                end
            end
            true
        end

end