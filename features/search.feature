Feature: Search for things.

Background:
    Given I sign in as a non-admin user
    #need statuses now that the homepage shows status discs below team names
    And I've set up the default statuses

Scenario: Simple search
  Given I have a team called "The Wombats" with an objective to "Git 'er done!"
  And I have a team called "The Gizmos" with an objective to "Hold a dance party."
  When I visit the homepage
  And I fill in "q" with "dance"
  And I click "Search"
  Then I should see "dance" within ".results"
  And I should see "Gizmos" within ".results"
  And I should NOT see "Git" within ".results"
