function check_in() {
  const checkIns = document.querySelectorAll(".check_in")

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

      }
    })
  })
}

window.addEventListener("turbo:load", check_in)