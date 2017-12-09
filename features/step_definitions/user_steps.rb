Given("the following users have been added") do |user_table|
  # table is a Cucumber::MultilineArgument::DataTable
  #pending # Write code here that turns the phrase above into concrete actions
  user_table.hashes.each do |user|
    User.new(:user_id =>user[:id],:user_first_name =>user[:firstName],:user_last_name =>user[:lastName],:user_administrator =>user[:adminStatus],:user_priority =>user[:priority],:user_phone_number =>user[:phoneNumber],:email =>user[:email],:password_digest =>user[:passwordDigest])
    # Each returned user will be a hash representing one row of the users_table
    # The keys will be the table headers and the values will be the row contents.
    # Entries can be linked directly to the database with ActiveRecord methods
    # Add the necessary Active Record call(s) to populate the database.
  end
end

Given ("I am signed in as an administrator") do
  #pending # Write code here that turns the phrase above into concrete actions
  email = "123@abc.com"
  password = "12345678"
  
  visit new_session_path
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Login'
end

When("I click the link {string}") do |link|
  pending # Write code here that turns the phrase above into concrete actions
  click_on link
end

When("I click the button {string}") do |button|
  pending # Write code here that turns the phrase above into concrete actions
  click_on button
end

When("I have added a new user with the first name {string}, last name {string}, email {string}, phone number {string}, user id {string}, administrative status {string}, user priority {string}, password {string}, password confirmation {string}") do |firstName, lastName, email, phoneNumber, userID, adminStatus, priority, password, passwordConfirm|
  pending # Write code here that turns the phrase above into concrete actions
  visit new_user_path
  fill_in 'First Name', :with => firstName
  fill_in 'Last Name', :with => lastName
  fill_in 'Email', :with => email
  fill_in 'Phone Number', :with => phoneNumber
  fill_in 'User ID', :with => userID
  select adminStatus, :from => 'Adminitrator Status'
  select priority, :from => 'User Priority'
  fill_in 'Password', :with => password
  fill_in 'Confirm Password', :with => passwordConfirm
  click_button 'Create New Account'
end

When("I have edited a user's information with the first name {string}, last name {string}, email {string}, phone number {string}, user id {string}, administrative status {string}, user priority {string}, password {string}, password confirmation {string}") do |firstName, lastName, email, phoneNumber, userID, adminStatus, priority, password, passwordConfirm|
  pending # Write code here that turns the phrase above into concrete actions
  visit new_user_path
  fill_in 'First Name', :with => firstName
  fill_in 'Last Name', :with => lastName
  fill_in 'Email', :with => email
  fill_in 'Phone Number', :with => phoneNumber
  fill_in 'User ID', :with => userID
  select adminStatus, :from => 'Adminitrator Status'
  select priority, :from => 'User Priority'
  fill_in 'Password', :with => password
  fill_in 'Confirm Password', :with => passwordConfirm
  click_button 'Update Account'
end

Then("I should see a new user with the first name {string}, last name {string}, email {string}, phone number {string}, user id {string}, administrative status {string}, user priority {string}, password {string}, password confirmation {string}") do |firstName, lastName, email, phoneNumber, userID, adminStatus, priority, password, passwordConfirm|
  pending # Write code here that turns the phrase above into concrete actions
  result=false
   all("tr").each do |tr|
     if tr.has_content?(firstName) && tr.has_content?(lastName) && tr.has_content?(email) && tr.has_content?(phoneNumber) && tr.has_content?(userID) && tr.has_content?(adminStatus) && tr.has_content?(priority) && tr.has_content?(password) && tr.has_content?(passwordConfirm)
       result = true
       break
     end
   end
  expect(result).to be_truthy
end

Then("I should see the text {string}") do |text|
  #pending # Write code here that turns the phrase above into concrete actions
  expect(page).to have_content(text)
end