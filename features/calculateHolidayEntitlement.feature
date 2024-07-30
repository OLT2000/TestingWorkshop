Feature: Calculate holiday entitlement
    Scenario: Homepage is visible
        Given I navigate to the homepage
        And I should see the homepage

    Scenario: Summary page displays inputs for regular working hours, hours per week and a full leave year.
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 37.5 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        Then I should see the correct submitted answers
        And I should see 210 entitlement "hours"

    Scenario: Summary page displays inputs for regular working hours, days worked per week and a full leave year.
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'days worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 5 for 'Number of days worked per week?'
        Then I should see the correct submitted answers
        And I should see 28 entitlement "days"

    Scenario: Regular working hours, annualised hours, full leave year, 5 days per week
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'annualised hours' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        Then I should see the correct submitted answers
        And I should see 5.6 entitlement "weeks"

    Scenario: Regular working hours, compressed hours, for a full leave year, 40 hours worked per week.
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'compressed hours' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 40 for 'Number of hours worked per week?'
        And I input 3 for 'Number of days worked per week?'
        Then I should see the correct submitted answers
        And I should see 224 entitlement "hours"

    Scenario: Regular working hours, shifts, for a full leave year, 8 hours per shift, 3 shifts per pattern, 7 days in each pattern
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'shifts' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to calculate the holiday:'
        And I input 8 for 'How many hours in each shift?'
        And I input 3 for 'How many shifts will be worked per shift pattern?'
        And I input 7 for 'How many days in the shift pattern?'
        Then I should see the correct submitted answers
        And I should see 16.8 entitlement "shifts"

    Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours

    Scenario: Updates calculation when value is edited
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' link
        And I select option 'No' for 'Does the employee work irregular hours or for part of the year?'
        And I select option 'hours worked per week' for 'Is the holiday entitlement based on:'
        And I select option 'for a full leave year' for 'Do you want to work out holiday:'
        And I input 37.5 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        And I want to change the value for 'Number of hours worked per week?'
        Then I am redirected to the page for 'Number of hours worked per week?'
        And The existing answers are saved
        And I input 35 for 'Number of hours worked per week?'
        And I input 5 for 'Number of days worked per week?'
        Then I should see the correct submitted answers
        And I should see 196 entitlement "hours"
