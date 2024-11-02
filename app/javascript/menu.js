document.addEventListener("turbo:load", () => {
  const toggle = document.getElementById("toggle")
  const menuList = document.getElementById("menu_list")

  toggle.addEventListener("click", () => {
    console.log("クリック検知")
    if (menuList.style.display === "block"){
      menuList.style.display = "none"
    } else if(menuList.style.display === "none") {
      menuList.style.display = "block"
    }
    
  })
})