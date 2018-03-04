
Given(/^I have a team called "([^"]*)"$/) do |name|
  Team.create!(name: name)
end

Given(/^I have a team called "([^"]*)" with a description "([^"]*)"$/) do |name, body|
  Team.create!(name: name, body: body)
end

Given(/^the team called "([^"]*)" has a sub\-team called "([^"]*)" with a description "([^"]*)"\.$/) do |arg1, arg2, arg3|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I visit the teams page$/) do
  visit "/teams"
end

Given(/^the team called "([^"]*)" has an objective to "([^"]*)"$/) do |team_name, goal_name|
  Team.find_by(name: team_name).objectives << Goal.create!(name: goal_name, end_date: Date.today.end_of_financial_quarter)
end

Given(/^I have a team called "([^"]*)" with an objective to "([^"]*)"$/) do |team_name, goal_name|
  Goal.create!(name: goal_name, end_date: Date.today.end_of_financial_quarter, team: Team.find_or_create_by!(name: team_name))
end

When(/^I nest the team (?:called )?"([^"]*)" under the team (?:called )?"([^"]*)"$/) do |child, parent|
    t = Team.find_by(name: child)
    t.parent = Team.find_by(name: parent)
    t.save!
end

Given(/^I have a team called "([^"]*)" with an objective to "([^"]*)" and a score of "([^"]*)" given by "([^"]*)" and a reason of "([^"]*)"$/) do |team_name, obj_name, amount, user_name, reason|
  t = Team.create!(name: team_name)
  Goal.create!(name: obj_name, team: t)
  Score.create!(goal: t.goals.first, amount: amount, reason: reason, user: User.find_by(name: user_name))
end

Given(/^I have a team called "([^"]*)" with an objective to "([^"]*)" and a body of "([^"]*)"$/) do |team, obj_name, body|
  t = Team.create!(name: team) # Write code here that turns the phrase above into concrete actions
  Goal.create!(name: obj_name, team: t, body: body)
end
