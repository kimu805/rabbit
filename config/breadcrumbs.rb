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
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).