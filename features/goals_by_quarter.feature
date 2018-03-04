Feature: Allow me to assign goals to a specific quarter and then browse by quarter.

Background:
    And I sign in as a non-admin user

@time_travel
Scenario: Let me assign an objective to the current or next quarter. But not previous...that would be rewriting history ;)
  Given the current date is 7 Sep 2017
  And I have a team called "GusGus"
  And I wait 2 seconds
  When I visit the team called "GusGus"
  And I click on "Add a new objective"
  Then I should see "Quarter"
  #radio buttons have a different format from the teams/show view where we spell the whole month name
  And I should see "Q2"
  And I should see "Q3"
  # Nope... only show one quarter ahead...for now
  #And I should see "Q4 January - March 2017"
  When I click on "Q3"
  And I fill in "goal[name]" with "What's the frequency, Kenneth?"
  And I click "Save objective"
  Then I should see "successfully created"
  And I should see "Q3 October - December 2017"
  When I click on "What's the frequency, Kenneth?"
  And I wait 1 second
  And I click on "Add a key result"
  Then I should see "Q3 October - December 2017" within "h3"
  #don't see the option to assign the KR to a different quarter from the Objective
  And I should NOT see "Q2 July - September 2017"
  When I fill in "goal[name]" with "My key result goes here."
  #And debug
  And I click on "Save key result"
  Then I should see "successfully"
  When I visit the team called "GusGus"
  Then I should see "Q3 October - December 2017"
