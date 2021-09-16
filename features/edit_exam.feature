Feature: Professor can edit his exam

    When i am logged in as a Professor
    I want to be able to edit my exam

    Scenario: Edit exam
        Given I am authenticated as Professor
        Given I am on the Grouped Welcome page
        When I follow "Exams"
        Then I should be on the Exams page
        When I follow "Edit Exam"
        Then I should be on the Edit Exam page
        When I fill in "Name" with "Esame Reti"
        And I fill in "Description" with "Esame di Reti"
        And I press "Edit Exam"
        Then I should be on the show Exam page
        And I should see "Esame Reti"