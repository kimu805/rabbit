document.addEventListener("turbo:load", () => {
  const toggle = document.getElementById("toggle")
  const menuList = document.getElementById("menu_list")

  toggle.addEventListener("click", () => {
    menuList.classList.toggle("active")
  })

  window
})