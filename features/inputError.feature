Feature: Numerical Input Errors handled correctly
    Scenario: Days worked per week greater than 7
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select the option 'days worked per week' for 'Is the holiday entitlement based on:'
        And I select the option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 7.5 for 'Number of days worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the open-text question

    Scenario: Days worked per week less than 0.5
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select the option 'days worked per week' for 'Is the holiday entitlement based on:'
        And I select the option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 0 for 'Number of days worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the open-text question

    Scenario: Hours worked per week greater than 168
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'hours worked per week'
        And I select the option 'for a full leave year'
        And I input '168.5' hours worked per week
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message telling me that there are only 168 hours in a week
        And I am given a link to re-answer the question
    
    Scenario: Hours worked per week less than 0.5
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'hours worked per week'
        And I select the option 'for a full leave year'
        And I input '0' hours worked per week
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message telling me to enter hours at least 0.5
        And I am given a link to re-answer the question

    Scenario: Working more hours than there are days
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'hours worked per week'
        And I select the option 'for a full leave year'
        And I input '25' hours worked per week
        And I input '1' days worked per week
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message telling me there are only 24 hours in a day.
        And I am given a link to re-answer the question

    Scenario: Displays error when the user does not select a mandatory field
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I do not select an option for irregular work hours
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question

    