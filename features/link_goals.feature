Feature: Let people link goals together.

Background:
    Given I sign in as a non-admin user
    ##Given I've set up the default statuses

Scenario: Link a couple of objectives to a primary objective
  Given I have a team called "The Zombies" with an objective to "Eat brains!"
  And I have a team called "Ninjas" with an objective to "Be sneaky!"
  And I have a team called "Tortoise" with an objective to "Walk 5% faster."
  When I visit the goal called "Eat brains!"
  Then I should NOT see "Linked OKRs" within "h2"
  When I click "Edit linked OKRs"
  Then I should see "Linked OKRs"
  And I should see "Eat brains!" within "h3"
  When I fill in "related_name" with "sneaky"
  #Search button technically has no text... makes this semantically weird.
  And I click on "" within ".big_form .btn"
  #And I wait 1 seconds
  #And debug
  Then I should see "Be sneaky!"
  And I should see "Ninjas"
  When I click on "Link to this objective"
  Then I should see "successfully"
  And I should see "Be sneaky!" within ".related"
  When I click on "Eat brains!"
  Then I should see "Linked OKRs" within "h2"
  When I click on "Be sneaky!"
  #And debug
  And I click "Edit linked OKRs"
  #search in lower case...
  When I fill in "related_name" with "walk"
  And I click on "" within ".big_form .btn"
  Then I should see "Tortoise" within ".results"
  When I click "Link to this" within ".results"
  And I click on "Be sneaky!"
  Then I should see "brains" within ".related"

Scenario: Remove links
  Given I have a team called "Ninjas" with an objective to "Be sneaky!"
  And I have a team called "The Zombies" with an objective to "Eat brains!"
  And I have a team called "Tortoise" with an objective to "Walk 5% faster."
  And the objective called "Walk 5% faster." is linked to the objective "Be sneaky!"
  And the objective called "Eat brains!" is linked to the objective "Be sneaky!"
  When I visit the objective called "Be sneaky!"
  Then I should see "Eat brains!" within ".related"
  And I should see "Walk 5% faster." within ".related"

  When I click on "Edit linked OKRs"
  And I click on "Remove link"
  Then I should see "Successfully removed"
  Then I should NOT see "brains" within ".related"
  And I should see "Walk" within ".related"
