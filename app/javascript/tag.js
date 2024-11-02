document.addEventListener("turbo:load", () => {
  const tagNameInput = document.getElementById("project_tag_tag_name")

  if (tagNameInput) {
    tagNameInput.addEventListener("input", () => {
      const keyword = tagNameInput.value
      
      const XHR = new XMLHttpRequest()
      XHR.open("GET", `/projects/search/?keyword=${keyword}`, true)
      XHR.responseType = "json"
      XHR.send()

      XHR.onload = () => {
        const searchResult = document.getElementById("search_result")
        searchResult.innerHTML = ""
        if (XHR.response) {
          const tagName = XHR.response.keyword
          tagName.forEach((tag) => {
            const childElement = document.createElement("div")
            childElement.setAttribute("class", "child")
            childElement.setAttribute("id", tag.id)
            childElement.innerHTML = tag.tag_name
            searchResult.appendChild(childElement)
  
            const clickElement = document.getElementById(tag.id)
            clickElement.addEventListener("click", () => {
              tagNameInput.value = clickElement.textContent
              searchResult.innerHTML = ""
            })
          })
        }
        
      }
    })
  }
})