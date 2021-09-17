class ProjectsController < ApplicationController

    def show
        @project = Project.find(params[:id])
        client = Octokit::Client.new(:client_id => "a08f56db54febfec2a18", :client_secret => "7489bef620b06a5a58d31501824488be49026019")
        if client.repository?(@project.repo)
            @readme = client.readme @project.repo, :accept => 'application/vnd.github.html'
           if (current_user.is_professor? && @project.exams.exists?(current_user.exams.first.id))
                @archive = client.archive_link(@project.repo)
            end
        end
    end
    def new
        @project = Project.new
    end
    def create
        @project = Project.new(params.require(:project).permit(:project_name, :description,:repo, exam_ids: []))
        authorize! :create, @project
        @project.users << current_user
        @project.user = current_user
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
        project = Project.find(params[:project])
        authorize! :destroy, Project
        project.destroy
        flash[:notice] = "Project removed"
        unset
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
        authorize! :update, project, :message => "You are not authorized"

        if project.update(params.require(:project).permit(:project_name, :description, :repo, exam_ids: []))
            flash[:notice] = "Project was updated successfully"
            redirect_to project
        else
            flash[:alert] = "Something wrong"
            render 'edit'
        end

    end

    private
        def unset 
            projects = current_user.projects.where(user: current_user)
            if projects.empty?
                current_user.unset_project_manager
            end
        end
        def can_create_project?(ids)
            ids.drop(1).each do |id|
                if !current_user.exams.exists?(id)
                    return false
                end
            end
            true
        end

end