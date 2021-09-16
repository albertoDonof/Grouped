require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I am authenticated as Student$/) do
    User.delete_all
    Exam.delete_all
    UserExam.delete_all
    e = Exam.create!(:id=>1, :name =>"LTW", :code=>"12345", :description=>"Esame di LTW")
    prod= User.create!(:id=>1 ,:email=>"profprova@groupedprova.com",
        :password => "password", :first_name => "prof" , :last_name => "Augusto",:roles_mask => 4)
    ue = UserExam.create!(:user_id=> 1, :exam_id=> 1)

    u = User.create!(:email=>"utenteprova@groupedprova.com", 
    :password => "password", :first_name => "Utente" , :last_name => "Prova",:roles_mask => 1 )
    e.save!
    prod.save!
    ue.save!
    u.save!
    visit "/"
    fill_in "Email", with: "utenteprova@groupedprova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end

Given('I am authenticated as Professor') do
    User.destroy_all
    Exam.destroy_all
    UserExam.destroy_all
    e = Exam.create!(:id=>1, :name =>"Esame LTW", :code=>"12345", :description=>"Esame di LTW")
    prod= User.create!(:id=>1 ,:email=>"profprova@groupedprova.com",
        :password => "password", :first_name => "prof" , :last_name => "Augusto",:roles_mask => 4)
    ue = UserExam.create!(:user_id=> 1, :exam_id=> 1)
    e.save!
    prod.save!
    ue.save!
    visit "/"
    fill_in "Email", with: "profprova@groupedprova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end
  

Given /^(?:|I) am on (.*)$/ do |page_name|
    visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
    fill_in(field, :with => value)
end

When('I press {string}') do |button|
    click_button(button)
end

When('I follow {string}') do |link|
    click_link(link, match: :first)
end

When /^(?:|I )go to (.+)$/ do |page_name|
    visit path_to(page_name)
  end

When('I follow {string} on one exam') do |link|
    click_link_or_button(link)
end

When('I check the Exam box') do
    check('project[exam_ids][]')
end

Then('I am registered to the exam') do
    page.has_content?('Unregister')
end  

Then /^I should be on (.*)/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end