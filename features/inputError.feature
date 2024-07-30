Feature: Numerical Input Errors handled correctly
    Scenario: Days worked per week greater than 7
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'days worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 7.5 for 'Number of days worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "There are only 7 days in a week. Please check and enter a correct value."

    Scenario: Days worked per week less than 0.5
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'days worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 0 for 'Number of days worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "There are only 7 days in a week. Please check and enter a correct value."

    Scenario: Hours worked per week greater than 168
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 168.5 for 'Number of hours worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "You can enter a maximum of 168 hours per week. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5"
    
    Scenario: Hours worked per week greater than 168
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 0 for 'Number of hours worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "Please enter at least .5 hours worked. Do not enter fractions. If you work half-hours, enter .5 for half. For example, 40.5"
    
    Scenario: Hours worked per week is non-numerical
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input '7/2' for 'Number of hours worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "Please answer this question"

 Scenario: Working more hours than there are days
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 25 for 'Number of hours worked per week?'
        And I input 1 for 'Number of days worked per week?'
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "There are only 24 hours per day. Please check and enter a correct value."

 Scenario: User does not select a value for irregular hours
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I click on the 'Continue' button
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a response link with text "Please answer this question"

    