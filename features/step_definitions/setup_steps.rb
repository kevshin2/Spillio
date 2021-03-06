Given /settings set/ do
	Setting.create(max_group_size: 3)
  Group.create({group_name: 'Admins'})
end

Given /the group size is (\d*)/ do |size|
	setting = Setting.first
	setting.max_group_size = size
	setting.save
end

#
# => Model creation
#

Given(/the following user[s]? exist[s]?:$/)do |users_table|
  users_table.hashes.each do |user|
    s = Student.create!(user)
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

Given(/the following project[s]? exist[s]?:$/) do |table|
  table.hashes.each do |proj|
    Project.create!(proj)
  end
end



Given(/^the student with cid "(.*?)" is a reader for "(.*)"$/) do |arg1, arg2|
  s = Student.find_by_cid(arg1)
  s.make_reader
  s.save

  g = Group.find_by_id(arg2)
  g.reader = s
  g.save
end

Given(/^the student with cid "(.*?)" is a reader$/) do |arg1|
  s = Student.find_by_cid(arg1)
  s.make_reader
  s.save
end
