Feature: As an administrator, I need to export data for long-term safe-keeping or further analysis.

Background:
    Given I sign in as a non-admin user
    ##Given I've set up the default statuses

Scenario: Export teams
  Given I have a team called "The Buzzards" with a description "Here is some detail about the team."
  And I have a team called "The Woodpeckers" with a description "Peck peck peck peck"
  When I nest the team called "The Woodpeckers" under the team called "Cheep cheep"
  When I sign in as an administrator
  And I click on "Admin"
  And I click on "Export teams"
  Then I should see "Peck peck peck peck"

#Scenario: Export statuses
#  When I sign in as an administrator
#  And I click on "Admin"
#  And I click on "Export statuses"
#  Then I should see "no issues to report"
#  And I should see "In progress"

Scenario: Export scores
  Given I sign in as a non-admin user named "Peter" with the email "peter@wherever.com"
  #make sure status matches whatever is in your seeds
  And I have a team called "The Buzzards" with an objective to "Release the hounds" and a score of "20" given by "Peter" and a reason of "Woof woof!"
  When I sign in as an administrator
  And I click on "Admin"
  And I click on "Export scores"
  Then I should see "20"
  And I should see "Release the hounds"

Scenario: Export goals
  Given I sign in as a non-admin user named "Peter" with the email "peter@wherever.com"
  And I have a team called "The Buzzards" with an objective to "Release the hounds" and a body of "These are the details about the hounds."
  When I sign in as an administrator
  And I click on "Admin"
  And I click on "Export OKRs"
  Then I should see "Release the hounds"
  And I should see "details about the hounds"
  And I should see "Buzz"

Scenario: Export people
  Given I sign in as a non-admin user named "Peter" with the email "peter@wherever.com"
  When I sign in as an administrator
  And I click on "Admin"
  And I click on "Export user"
  Then I should see "Peter"
  And I should see "peter@wherever"
