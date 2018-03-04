Given(/^I have a user named "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have some users$/) do
  5.times do |i|
    u = User.create(name: "User#{i}", email: "testUser#{i}@test_app.com")
    u.skip_confirmation!
    u.save(validate: false)
  end
end
