10.times do |i|
  user = User.create!(nickname: "user#{i+1}", email: "user#{i+1}@user.com", password: "111111", password_confirmation: "111111" )
  project = Project.create!(title: "project#{i+1}", description: "description of project#{i+1}", display: 0, user_id: user.id )
  10.times do |n|
    habit = Habit.create!(name: "habit#{n+1}", content: "content of habit#{n+1}", frequency: 1, project_id: project.id)
    (Date.today..(Date.today + 30)).each do |date| 
      habit.check_ins.create!(date: date, status: false)
    end
  end
end

3.times do |i|
  Tag.create!(tag_name: "tag#{i+1}")
end

3.times do |i|
  ProjectTagRelation.create!(project_id: i+1, tag_id: 1)
end

3.times do |i|
  ProjectTagRelation.create!(project_id: i+4, tag_id: 2)
end

3.times do |i|
  ProjectTagRelation.create!(project_id: i+7, tag_id: 3)
end

ProjectTagRelation.create!(project_id: 10, tag_id: 1)