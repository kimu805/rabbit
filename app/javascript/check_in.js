function check_in() {
  const checkIns = document.querySelectorAll(".projectShow_checkIns_table_checkInForm")

  checkIns.forEach((checkIn) => {
    checkIn.addEventListener("change", (e) => {
      e.preventDefault()
      const formData = new FormData(checkIn)
      const projectId = checkIn.getAttribute("data-project-id")
      const habitId = checkIn.getAttribute("data-habit-id")
      const checkInId = checkIn.getAttribute("data-id")
      
      const XHR = new XMLHttpRequest()
      XHR.open("PATCH", `/projects/${projectId}/habits/${habitId}/check_ins/${checkInId}`, true)
      XHR.responseType = "json"
      XHR.send(formData)

      XHR.onload = () => {
        const achievement_rate = XHR.response.achievement_rate
        const achievementField = document.getElementById(`habit${habitId}achievement`)
        achievementField.innerHTML = `${achievement_rate}%`

        const overall_achievement_rate = XHR.response.overall_achievement_rate
        const overallAchievementField = document.getElementById(`project${projectId}achievement`)
        overallAchievementField.innerHTML = `${overall_achievement_rate}%`
      }
    })
  })
}

window.addEventListener("turbo:load", check_in)