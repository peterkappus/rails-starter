Feature: A nice looking wall-board that shows the realtime status of everything.

Background:
    Given I sign in as an admin user
    #Given I've set up the default statuses

Scenario: Create goals and show wallboard
  Given I have a team called "The Protons" with an objective to "Be massively awesome"
  And I visit the team called "The Protons"
  And I click "View current quarter as wallboard"
  Then I should see "The Protons"
  And I should see "Be massively awesome"
