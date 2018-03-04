When(/^I sign in as a non-admin user$/) do
  create_user_and_sign_in("Non Admin","test@test.com")
end

Given(/^I sign in as a non\-admin (?:user )?named "([^"]*)" with the email "([^"]*)"$/) do |name, email|
  create_user_and_sign_in(name, email)
end

Given(/^the allowable domain is "([^"]*)"$/) do |domain|
  Rails.application.config.valid_email_domain = domain
end

When(/^I sign in as an (?:admin user)?(?:administrator)?$/) do
  create_user_and_sign_in("Admin person","admin@test.com", true)
end


def create_user_and_sign_in(name, email, is_admin = false)
  user = User.find_by(email: email)
  unless(user)
    user = User.new({name: name, email: email, password: "password", password_confirmation: "password", admin: is_admin})
    user.skip_confirmation!
    #don't validate for this... otherwise the tests are dependent on the "allowed domain" env variable
    user.save(validate:false)
  end

  login_as(user, :scope=>:user)
  visit "/"
end
