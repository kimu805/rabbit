crumb :root do
  link "タグ一覧", root_path
end

crumb :tag do |tag|
  link tag.tag_name, tag_path(tag)
  parent :root
end

crumb :project do |tag, project|
  link project.title, project_path(project)
  parent :tag, tag
end

crumb :user do |user, project, tag|
  link user.nickname, user_path(user)
  parent :project, [tag, project]
end

crumb :habit do |project, habit|
  link habit.name, project_habit_path(project, habit)
  parent :project, project
end
