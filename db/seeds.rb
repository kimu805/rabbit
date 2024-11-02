10.times do |i|
  user = User.create!(nickname: "user#{i+1}", email: "user#{i+1}@user.com", password: "111111", password_confirmation: "111111" )
  project = Project.create!(title: "project#{i+1}", description: "description of project#{i+1}", display: 0, user_id: user.id )
end

3.times do |i|
  tag = Tag.create!(tag_name: "tag#{i+1}")
  10.times do |n|
    ProjectTagRelation.create!(project_id: n+1, tag_id: tag.id)
  end
end