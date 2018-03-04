Feature: As an administrator, I may need to import my saved data after a cataclysmic data loss or other bad bad not good situation.

Background:
    Given I sign in as an admin user
    ##Given I've set up the default statuses

Scenario: Import teams, users, goals, and scores
  When I import teams
  Then I should see "Successfully imported"

Scenario: Import Users
  When I import people
  Then I should see "Successfully imported"
  When I click on "People" within ".nav"
  Then I should see "Mabuse"

@wip
Scenario: Import goals & scores
  When I import teams
  Then I should see "Successfully imported"
  And I import people
  Then I should see "Successfully imported"
  And I import goals
  Then I should see "Successfully imported"
  And I import scores
  Then I should see "Successfully imported"

  #now look at the data.
  When I click "Teams" within ".nav"
  Then I should see "Team A"
  And I should see "Team B"
  When I click "Team A"
  And I click on "Team A1"
  And I click on "peanut"
  And I click on "An apple"
  Then I should see "apple detail"
  And I should see "80%"
  And I should see "Delicious"
  And I should see "Suzy Admin" within ".hint"
  When I click on "Team A"
  And I click on "banana"
  And I click on "grape"
  And I click on "See all progress"
  Then I should see "Delicious grapes"
  And I should see "Cindy Williams" within ".small"
