Feature: Calculate holiday entitlement

Scenario: Homepage is visible
    Given I navigate to the homepage
    And I should see the homepage

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I input 5 days worked per week
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


