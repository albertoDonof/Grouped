Feature: Student can create a project

    When i am logged in as a student
    I want to create a project for an exam

    Scenario: Create a project
        Given I am authenticated as Student
        Given I am on the Grouped Welcome page
        When I follow "Subscribe to exam for create project"
        Then I should be on the Exams page
        When I follow "Register" on one exam
        Then I am registered to the exam
        When I follow "Create Project"
        Then I should be on the Create Project page
        When I fill in "Project name" with "Progetto Prova"
        And I fill in "Description" with "Progetto prova per esame"
        And I check the Exam box
        And I press "Create Project"
        Then I should be on the Project page
        And I should see "Progetto Prova"
