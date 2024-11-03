function check_in() {
  const checkIn = document.getElementById("check_in")

  checkIn.addEventListener("submit", (e) => {
    e.preventDefault()
    console.log("更新検知")
  })
}

window.addEventListener("turbo:load", check_in)