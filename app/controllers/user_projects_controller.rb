class UserProjectsController < ApplicationController
    def create
    end
    def destroy
        user_project = UserProject.where(user: current_user, project_id: params[:project]).first
        user_project.destroy
        flash[:notice] = "Project removed"
        redirect_to exam_path(params[:exam])
    end
    
end