Feature: Page Navigation Functionality
    Scenario: I want to start again after completing my forms
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 37.5 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        And I click on the 'Start again' link
        Then I should see the homepage

    Scenario: I want to complete the form again but change to working irregular hours
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 37.5 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        And I click on the 'use the calculator again' link
        Then I am redirected to the 'Does the employee work irregular hours or for part of the year?' page
