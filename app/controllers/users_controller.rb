class UsersController < ApplicationController
    def index
        
        @students = User.non_professors
    end
    def show
        @student = User.find(params[:id])
    end

    def index_professors
        @professors = User.professors
    end
    def destroy
        user = User.find(params[:id])
        authorize! :destroy, user, :message => "You are not authorized"
        user.destroy
        flash[:notice] = "User removed"
        if user.is_professor?
            redirect_to professors_path
        else
            redirect_to users_path
        end
    end

    def upgrade_student
        student = User.find(params[:format])
        authorize! :manage, student
        student.set_project_manager
        student.set_professor
        redirect_to users_path


    end
    
    
end