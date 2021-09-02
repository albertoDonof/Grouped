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
    def show_professor
    end
    
    
end