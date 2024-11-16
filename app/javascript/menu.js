function menu() {
  const toggle = document.getElementById("toggle")
  const menuList = document.getElementById("menu_list")

  toggle.addEventListener("click", () => {
    menuList.classList.toggle("active")
  })

  window.addEventListener("click", (event) => {
    if (event.target != toggle && event.target != menuList ) {
      menuList.classList.remove("active")
    }
  })
}

window.addEventListener("turbo:load", menu)
window.addEventListener("turbo:render", menu)