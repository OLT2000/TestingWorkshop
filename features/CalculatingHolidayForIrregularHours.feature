Feature: Calculate holiday entitlement with irregular hours


#DaysPerWeek
Scenario: Calculate the correct holiday entitlement - irregular hours, days per week, For a full year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option 'Yes' for working irregular hours
    And I input when my leave year starts
    And I select the option days worked per week
    And I select the option for a full leave year
    And I input '5' days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours


Scenario: Calculate the correct holiday entitlement - irregular hours, days per week, for someone starting part way through a leave year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option 'Yes' for working irregular hours
    And I input when my leave year starts
    And I select the option days worked per week
    And I select the option for someone starting part way through a leave year
    And I input my employment date
    And I input '5' days worked per week
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours


Scenario: Calculate the correct holiday entitlement - irregular hours, days per week, for someone leaving part way through a leave year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option 'Yes' for working irregular hours
    And I input when my leave year starts
    And I select the option days worked per week
    And I select the option for someone leaving part way through a leave year
    And I input my employment end date
    And I input '5' days worked per week
    And I input 5 days worked per week
    Then I should see the correct submitted answers
    And I should see the total entitlement hours

Scenario: Calculate the correct holiday entitlement - irregular hours, days per week, for someone starting and leaving part way through a leave year
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option 'Yes' for working irregular hours
    And I input when my leave year starts
    And I select the option days worked per week
    And I select the option for someone starting and leaving part way through a leave year
    And I input my employment date
    And I input my employment end date
    Then I should see the correct submitted answers
    And I should see the total entitlement hours

