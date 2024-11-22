crumb :root do
  link "Home", root_path
end

crumb :tag do |tag|
  link tag.tag_name, tag_path(tag)
  parent :root
end

crumb :project do |tag, project|
  link project.title, project_path(project, tag: tag)
  parent :tag, tag
end

crumb :user do |tag, project, user|
  link user.nickname, user_path(user, tag: tag, project: project)
  parent :project, [tag, project]
end

crumb :habit do |tag, project, habit|
  link habit.name, project_habit_path(project, habit, tag: tag)
  parent :project, [tag, project]
end
