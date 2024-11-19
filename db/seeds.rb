tags = [ "Health", "Study", "Bussiness", "Dance" ]

tags.each do |tag_name|
  Tag.create!(tag_name: tag_name)
end

10.times do |i|
  user = User.create!(nickname: "ユーザー#{i+1}", profile:"ユーザー#{i+1}のプロフィールです。", email: "user#{i+1}@user.com", password: "111111", password_confirmation: "111111")
  project = Project.create!(title: "プロジェクト#{i+1}", description: "プロジェクト#{i+1}の概要です。", display: 1, user_id: user.id)
  5.times do |n|
    habit = Habit.create!(name: "習慣#{n+1}", content: "習慣#{n+1}の内容です。", frequency: 1, project_id: project.id)
    (Date.today..(Date.today + 30)).each do |date| 
      habit.check_ins.create!(date: date, status: false)
    end
  end
end

10.times do |i|
  project = Project.create!(title: "プロジェクト#{i+11}", description: "プロジェクト#{i+11}の概要です。", display: 0, user_id: i+1)
  5.times do |n|
    habit = Habit.create!(name: "習慣#{n+1}", content: "習慣#{n+1}の内容です。", frequency: 1, project_id: project.id)
    (Date.today..(Date.today + 30)).each do |date| 
      habit.check_ins.create!(date: date, status: false)
    end
  end
end

20.times do |i|
  project = Project.find(i+1)
  tag = tags[i % 4]
  project.tags << Tag.find_by(tag_name: tag)
end