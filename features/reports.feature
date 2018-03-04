Feature: As a user, I'd like a common starting place where I can quickly get an overview of things relevant to me and dive into other areas of the site for more detail.

Background:
    #Given I've set up the default statuses
    And I sign in as a non-admin user
    And the team called "The Walruses" has some scored OKRs from last quarter
    And I have a team called "The Walruses" has some scored OKRs from this quarter
    And I sign in as a non-admin user
    And I visit the home page
    And I click on "See goals from last quarter"

Scenario: See the quarterly report for last quarter
  Then I should see "The Walruses"

Scenario: See the quarterly reports for this quarter
  Then I should see "The Walruses"



#@wip
#Scenario: See all goals this quarter across all teams
#  Given I have a team called "The Peaky Blinders" with some scored OKRs from this quarter
#  When I visit the homepage
#  And I click on "All goals this quarter"
#  Then I should see "Peaky"
