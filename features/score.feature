Feature: As a user, I need a way to share progress and issues so that other teams and stakeholders can easily see what's going on with my goals.

Background:
    Given I sign in as a non-admin user
    And I've set up the default statuses
    And I have a team called "Peter Gabriel" with an objective to "Shock the monkey"
    And I visit the goal called "Shock the monkey"


#Not implemented yet...
#Scenario: See "not started" for new goals
#  Then I should see "Not started"

Scenario Outline: Update a new goal and see progress in various ways.
  When I click on "Report progress"
  Then I should NOT see "Finished"
  And I fill in "score[amount]" with "<progress>"
  And I fill in "score[confidence]" with "<confidence>"
  And I fill in "score[reason]" with "<narrative>"
  And I click on "Save"
  Then I should see "<progress>%"
  And I should see "<confidence>%"
  And I should see "<narrative>"
  And I should see "<status>"

  Examples:
    | progress | confidence | narrative            | status      |
    |  12      |  5         |  I've started        | In trouble  |
    |  50      |  50        |  Getting there       | At risk     |
    |  50      |  75        |  Feeling better      | On track    |

Scenario Outline: Close a goal and see Results
  When I click on "Close this"
  Then I should NOT see "Finished"
  And I should NOT see "Confidence"
  And I should see "Outcome"
  And I fill in "score[amount]" with "<progress>"
  And I fill in "score[reason]" with "<narrative>"
  And I fill in "score[learnings]" with "What we learned..."
  And I click on "Save"
  Then I should see "<progress>%"
  And I should see "<narrative>"
  And I should see "<status>"

  Examples:
    | progress | confidence | narrative            | status      |
    |  12      |  5         |  I've started        | Not delivered  |
    |  60      |  50        |  Getting there       | Partially delivered     |
    |  75      |  75        |  Feeling better      | Delivered    |


@javascript
Scenario: Prompt to fill in "Lessons learned" when marking a goal as complete or cancelled.
  When I click on "Close this objective"
  Then I should see "Lessons learned"
  When I click "Save"
  Then I should see "This field is required."
  When I fill in "score[learnings]" with "We learned so much."
  And I fill in "score[reason]" with "Here are some reasons why we gave this goal this score."
  And I fill in "score[amount]" with "25"
  #required now
  And I should NOT see "Confidence"
  #And I fill in "score[confidence]" with "100"
  And I click "Save"
  Then I should see "Successfully"
  And I should see "We learned so much"

@javascript
Scenario: Form validation
  And I click on "Report progress"
  #weird, phantomjs fails to find "Complete" if I don't wait a second or two
  And I wait 1 second
  And I fill in "score[amount]" with ""
  And I click "Save"
  Then I should see "required" within ".error"
  When I fill in "score[amount]" with "23592385092835"
  And I click "Save"
  Then I should see "colossal" within ".error"
  When I fill in "score[amount]" with "25"
  And I fill in "score[reason]" with ""
  And I click "Save"
  Then I should see "This field is required" within ".error"
  And I fill in "score[reason]" with "Things are going great."
  And I click "Save"
  #for the confidence
  Then I should see "required" within ".error"
  When I fill in "score[confidence]" with "80"
  And I click "Save"
  Then I should see "Successfully"
  And I should see "going great."
