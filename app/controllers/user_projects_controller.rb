class UserProjectsController < ApplicationController
    def create
        project = Project.find(params[:project])
        user = User.find(params[:user])
        if can_add?(project,user)
            @user_project = UserProject.create(user: user, project: project)
            authorize! :create, @user_project

            flash[:notice] = "#{user.full_name} added"
            redirect_to users_path
        else 
            flash[:alert] = "#{user.full_name} isn't register to the exams"
            redirect_to users_path

        end
    end
    def destroy
        user_project = UserProject.where(user: params[:student], project: params[:project]).first
        authorize! :destroy, user_project
        user_project.destroy
        flash[:notice] = "successfully removed"
        redirect_to project_path(params[:project])
    end
    

    private
        def can_add?(project, user)
            project.exams.each do |exam|
                if !user.exams.exists?(exam.id)
                    return false
                true
                end
            end
        end
end