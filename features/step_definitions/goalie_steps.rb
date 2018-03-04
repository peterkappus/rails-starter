

include Warden::Test::Helpers


=begin NOT USED
Given(/^I set up some demo data$/) do
  #for now, one team, one Objective.
  t = Team.create!(name: "The Protons")
  g = t.goals<< Goal.create!(team: t, name: "Be massively awesome")
end
=end

When(/^I visit the (?:key result|objective|goal) called "([^"]*)"$/) do |name|
  visit goal_path(Goal.find_by(name: name))
end

When(/^I visit the team called "([^"]*)"$/) do |name|
  visit team_path(Team.find_by(name: name))
end

Given(/^the objective "([^"]*)" has a key result "([^"]*)"$/) do |obj_name, key_result_name|
  g = Goal.find_by(name: obj_name)
  g.key_results << Goal.create!(name: key_result_name, team: g.team, end_date: Date.today.end_of_financial_quarter)
end

Given(/^the (?:key result|objective|goal) called "([^"]*)" is linked to the objective "([^"]*)"$/) do |source_name, target_name|
  source = Goal.find_by(name: source_name) or raise "Couldn't find goal named '#{source_name}'"
  target = Goal.find_by(name: target_name) or raise "Couldn't find goal named '#{target_name}'"
  source.linked_goals << target
end


#http://vedanova.com/rails/cucumber/2013/08/02/run-rake-tasks-cucumber-rspec.html
def execute_rake(file, task)
  require 'rake'
  rake = Rake::Application.new
  Rake.application = rake
  Rake::Task.define_task(:environment)
  load "#{Rails.root}/lib/tasks/#{file}"
  rake[task].invoke
end
