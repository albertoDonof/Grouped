module NavigationHelpers
    def path_to(page_name)
        case page_name

        when /^the Grouped login page/
            '/users/sign_in'
        when /^the Grouped Welcome page/
            '/' 
        when /^the Exams page/
            '/exams'
        when /^the Create Project page/
            '/projects/new'
        when /^the Project page/
            '/projects/1'
        when /^the Edit Exam page/
            '/exams/1/edit'
        when /^the show Exam page/
            '/exams/1'
        when /^Delete/
            '/exams/1'

        else
            begin
                page_name =~ /^the (.*) page$/
                path_components = $1.split(/\s+/)
                self.send(path_components.push('path').join('_').to_sym)
            rescue NoMethodError, ArgumentError
                 raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                "Now, go and add a mapping in #{__FILE__}"
            end
        end
    end
end

World(NavigationHelpers)