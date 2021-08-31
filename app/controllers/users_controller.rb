class UsersController < ApplicationController
    def index
        @students = User.students
    end
    def show
        @student = User.find(params[:id])
    end

    def index_professor
    end
    def show_professor
    end
end