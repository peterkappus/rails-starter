Feature: Make sure I can sign up, sign in, sign out, etc.


#@wip
#Not yet...
#Scenario: Sign in and create a new objective
#  Given I sign in as a non-admin user named "Peter" with the email "peter@test.com"
#  #And I have an objective named "Get fit" with a key result named "Walk 30min per day"
#  When I click on "Peter"
#  Then I should see "Objectives" within "h2"
#  When I click on "Add a new objective"
#  And I fill in "goal[name]" with "Get fit"
#  And I click "Add a new objective"
#  Then I should see "Get fit"
#  When I click on "Get fit"
#  And I click on "Add a new key result"
#  And I fill in "goal[name]" with "Walk 200 miles this quarter"
#  When I click on "Create key result"
#  Then I should see "Success"

Scenario: DON'T Let me sign up, with an invalid email domain
  When I visit the homepage
  And I click on "Sign up"
  And I fill in "user[name]" with "Peter Tester"
  Given the allowable domain is "somedomain2017.com"
  And I fill in "user[email]" with "peter.tester@invaliddomain2017.com"
  And I fill in "user[password]" with "supersecret"
  And I fill in "user[password_confirmation]" with "supersecret"
  And I click on "Sign up" button
  Then I should see "must be in the domain somedomain2017.com"

Scenario: Let me sign up, and send me the confirmation email
  When I visit the homepage
  And I click on "Sign up"
  And I fill in "user[name]" with "Peter Tester"
  Given the allowable domain is "somedomain2017.com"
  And I fill in "user[email]" with "peter.tester@somedomain2017.com"
  And I fill in "user[password]" with "supersecret"
  And I fill in "user[password_confirmation]" with "supersecret"
  And I click on "Sign up" button
  Then "peter.tester@somedomain2017.com" should receive an email with subject "Please confirm your email."

Scenario: Sign in and see my name, then sign out and don't see my name
  Given I sign in as a non-admin user named "Petronius" with the email "peter@test.com"
  Then I should see "Petronius"
  When I click "Sign out"
  Then I should NOT see "Petronius"

Scenario: Sign in as a non-admin and don't see option to modify people. Then log in as admin and see "edit", "destroy" buttons
  Given I sign in as a non-admin user named "Joe" with the email "joe@wherever.com"
  And I click on "People" within ".nav"
  Then I should NOT see "Edit"
  And I should NOT see "Destroy"
  When I click "Sign out"
  And I sign in as an admin user
  And I wait 1 second
  And I click on "People"
  Then I should see "Edit"

Scenario: Don't see "edit this team" options when you're a non-admin
  Given I have a team called "Bauhaus"
  And I sign in as a non-admin user
  And I visit the teams page
  And I click on "Bauhaus"
  Then I should NOT see "Edit or move"
  When I sign in as an admin user
  And I visit the teams page
  And I click on "Bauhaus"
  Then I should see "Admin actions"
  And I should see "Edit or move"
