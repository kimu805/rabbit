function menu() {
  const toggle = document.getElementById("toggle")
  const menuList = document.getElementById("menu_list")

  menuList.classList.remove("active")

  toggle.addEventListener("click", () => {
    menuList.classList.toggle("active")
  })

  window.addEventListener("click", (event) => {
    if (event.target != toggle && !menuList.contains(event.target) ) {
      menuList.classList.remove("active")
    }
  })
}

window.addEventListener("turbo:load", menu)