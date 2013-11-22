Given /^I am logged in with cid "(.*)"$/i do |cas_user|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
end

# Prefabricates a user model with the given cas ide so we dont need to go
# through all the steps
Given /^I am logged in with cid "(.*)" as a (.*)$/i do |cas_user, user_type|
  CASClient::Frameworks::Rails::Filter.fake(cas_user)
  case user_type
  when 'Student'
    s = {
      name: 'Anon Student',
      about: 'Nothing to say',
      interest: 'Everything',
      section: Section.find_or_initialize_by_number(100),
      skills: [Skill.find_or_initialize_by_name('Ruby')],
      courses: [Course.find_or_initialize_by_name('CS161')]
    }
    Student.create_for_current_user!(s, cas_user)
  end
  # TODO Implement more cases: instructor, admin
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Given(/the following user[s]? exist[s]?:$/)do |users_table|
  users_table.hashes.each do |user|
    Student.create!(user)
  end
end

Given(/the following instructor[s]? exist[s]?:$/) do |table|
  table.hashes.each do |int|
    Instructor.create!(int)
  end
end

Given(/the following group[s]? exist[s]?:$/) do |table|
  table.hashes.each do |gro|
    Group.create!(gro)
  end
end


Given(/the following student[s]? exist[s]?:$/) do |table|
  table.hashes.each do |stu|
    Student.create!(stu)
  end
end