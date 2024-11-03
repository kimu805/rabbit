function check_in() {
  const checkInForm = document.getElementById("check_in_form")

  checkInForm.addEventListener("submit" (e) => {
    e.preventDefault()
    console.log("更新検知")
  })
}

window.addEventListener("turbo:load", check_in)