Feature: Test the most basic bits of the app.


Scenario: See "About" on the "About" page.
  Given I sign in as a non-admin user
  When I visit the homepage
  And I click on "About"
  #Then debug
  Then I should see "About" within "h1"
