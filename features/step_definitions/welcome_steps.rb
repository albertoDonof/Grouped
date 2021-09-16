Given('I am just logged in') do
     visit "/"
end

Then('I should see {string}') do |string|
    page.has_content?(string)
end

Then('I should not see {string}') do |string|
    page.should have_no_content(string)
end
  