Feature: Calculate holiday entitlement
    Scenario: Homepage is visible
        Given I navigate to the homepage
        And I should see the homepage

    Scenario: Calculate the correct holiday entitlement for an employee who works regular hours
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select the option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select the option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 37.5 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        Then I should see the correct submitted answers
        And I should see the total entitlement hours

    Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours

    Scenario: Displays error when the user does not select a mandatory field
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I do not select an option for irregular work hours
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question

    Scenario: Updates calculation when value is edited


