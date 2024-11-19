// userShow project_tab
function project_tab() {
  const myProjectsTab = document.getElementById("myProjects_tab")
  const myProjectsTabText = document.getElementById("myProjects_tab_text")
  const myProjectsContainer = document.getElementById("myProjects_container")
  const likedProjectsTab = document.getElementById("likedProjects_tab")
  const likedProjectsTabText = document.getElementById("likedProjects_tab_text")
  const likedProjectsContainer = document.getElementById("likedProjects_container")

  if (!myProjectsTab) return null

  myProjectsTab.addEventListener("click", () => {
    myProjectsTabText.classList.remove("active")
    likedProjectsTabText.classList.remove("active")
    myProjectsContainer.classList.add("hidden")
    likedProjectsContainer.classList.add("hidden")

    myProjectsTabText.classList.add("active")
    myProjectsContainer.classList.remove("hidden")
  })

  likedProjectsTab.addEventListener("click", () => {
    myProjectsTabText.classList.remove("active")
    likedProjectsTabText.classList.remove("active")
    myProjectsContainer.classList.add("hidden")
    likedProjectsContainer.classList.add("hidden")

    likedProjectsTabText.classList.add("active")
    likedProjectsContainer.classList.remove("hidden")
  })
}


window.addEventListener("turbo:load", project_tab)
window.addEventListener("turbo:render", project_tab)