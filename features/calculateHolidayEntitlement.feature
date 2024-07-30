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

    Scenario: Summary page displays inputs for regular working hours, days worked per week and a full leave year.
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'days worked per week'
        And I select the option 'for a full leave year'
        And I input '5' days worked per week
        Then The row 'does the employee work irregular hours or for part of the year' has the value 'no'
        And The row 'is the holiday entitlement based on' has the value 'days worked per week'
        And The row 'do you want to work out holiday:' has the value 'for a full leave year'
        And The row 'Number of hours worked per week?' has the value '37.5'
        And The row 'Number of days worked per week?' has the value	'5.0'

    Scenario: Summary page displays inputs for regular working hours, hours per week and a full leave year.
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'hours worked per week'
        And I select the option 'for a full leave year'
        And I input '37.5' hours worked per week
        And I input '5' days worked per week
        Then The row 'does the employee work irregular hours or for part of the year' has the value 'no'
        And The row 'is the holiday entitlement based on' has the value 'hours worked per week'
        And The row 'do you want to work out holiday:' has the value 'for a full leave year'
        And The row 'Number of hours worked per week?' has the value '37.5'
        And The row 'Number of days worked per week?' has the value	'5.0'

    Scenario: Displays the values that were inputted by the user on the summary page
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'annualised hours'
        And I select the option 'for a full leave year'
        Then The row 'does the employee work irregular hours or for part of the year' has the value 'no'
        And The row 'is the holiday entitlement based on' has the value 'annualised hours'
        And The row 'do you want to work out holiday:' has the value 'for a full leave year'

    Scenario: Displays the values that were inputted by the user on the summary page
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'compressed hours '
        And I select the option 'for a full leave year'
        And I input '37.5' hours worked per week
        And I input '5' days worked per week
        Then The row 'does the employee work irregular hours or for part of the year' has the value 'no'
        And The row 'is the holiday entitlement based on' has the value 'compressed hours'
        And The row 'do you want to work out holiday:' has the value 'for a full leave year'
        And The row 'Number of hours worked per week?' has the value '37.5'
        And The row 'Number of days worked per week?' has the value	'5.0'

    Scenario: Displays the values that were inputted by the user on the summary page
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option 'no' for working irregular hours
        And I select the option 'shifts '
        And I select the option 'for a full leave year'
        And I input '8' hours worked per shift
        And I input '5' shifts worked per shift pattern
        And I input '7' days in the shift pattern
        Then The row 'does the employee work irregular hours or for part of the year' has the value 'no'
        And The row 'is the holiday entitlement based on' has the value 'shifts'
        And The row 'do you want to work out holiday:' has the value 'for a full leave year'
        And The row 'How many hours in each shift' has the value '8.0'
        And The row 'How many shifts will be worked per shift pattern' has the value '5'
        And the row 'How many days in the shift pattern' has the value '7.0'

    Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours

        Scenario: Updates calculation when value is edited


