Feature: Error Messages when inputting month values
    Scenario: Handle month greater than 12
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option yes for working irregular hours
        And I input 13 for my month
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question

    Scenario: Handle month less than 1
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option yes for working irregular hours
        And I input 0 for my month
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question

    Scenario: Handle day less than 1
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option yes for working irregular hours
        And I input 0 for my day
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question

    Scenario: Handle day greater than a month allows
        Given I navigate to the homepage
        And I should see the homepage
        When I click on the 'Start now' button
        And I select the option yes for working irregular hours
        And I input a day greater than the month allows
        And I click Continue
        Then I do not redirect to a new page
        And I am provided with an error message
        And I am given a link to re-answer the question
