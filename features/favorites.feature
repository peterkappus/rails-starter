Feature: As a user, I want to "watch" or "favourite" specific goals that I'm interested in so that I can find them easily and track their progress.

Background:
    Given I sign in as a non-admin user
    And I've set up the default statuses

Scenario: Add to watchlist and see on dashboard, then remove and don't see
  Given I have a team called "The Buzzards" with an objective to "Have a house party"
  And I have a team called "The Buzzkills" with an objective to "Go to bed early"
  When I visit the objective called "Have a house party"
  And I click on "Add to favourites"
  Then I should see "Successfully added"
  When I click on "Teams"
  Then I should see "house party" within ".favs"
  When I click on "house party"
  And I click on "Remove from favourites"
  Then I should see "Successfully removed"
  When I visit the teams page
  Then I should NOT see "house party" within ".results"
