When(/^I import (\w+)$/) do |what|
  steps %Q{
    When I click on "Admin"
    And I attach "features/sample_csvs/#{what}.csv" to the field called "file"
    And I click "Import"
  }
end
