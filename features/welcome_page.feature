Feature: Welcome Page

    In order to start using the website
    When i am logged in
    I want to see the welcome page of the app

    Scenario: View Welcome Page
        Given I am authenticated as Student
        Then I should see "Welcome to Grouped"