class ProjectsController < ApplicationController

    def show
        @project = Project.find(params[:id])
    end
    def new
        @project = Project.new
    end
    def create
        @project = Project.new(params.require(:project).permit(:project_name, :description, exam_ids: []))
        @project.users << current_user
        if @project.save
            if can_create_project?(params[:project][:exam_ids])
                flash[:notice] = "Projec was created successfully"
                current_user.set_project_manager
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
    def destroy
        user_project = UserProject.where(user: current_user, project_id: params[:project]).first
        user_project.destroy
        flash[:notice] = "Project removed"
        if params[:exam].nil?
            redirect_to user_path(current_user)
        else
            redirect_to exam_path(params[:exam])
        end
    end

    def edit
        @project = Project.find(params[:id])
    end
    def update
        project = Project.find(params[:id])
        if project.update(params.require(:project).permit(:project_name, :description, exam_ids: []))
            flash[:notice] = "Project was updated successfully"
            redirect_to project
        else
            flash[:alert] = "Something wrong"
            render 'edit'
        end

    end

    private
        def can_create_project?(ids)
            ids.drop(1).each do |id|
                if !current_user.exams.exists?(id)
                    return false
                end
            end
            true
        end

end