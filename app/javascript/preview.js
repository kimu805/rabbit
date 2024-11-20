// userIcon preview
function preview() {
  const fileField = document.getElementById("icon_filefield")
  const previews = document.querySelector(".form_icon_previews")
  if (!fileField) return null

  fileField.addEventListener("change", (e) => {

    const alreadyPreview = document.querySelector(".preview")
    if (alreadyPreview) alreadyPreview.remove()

    const file = e.target.files[0]
    const blob = URL.createObjectURL(file)
    
    const preview = document.createElement("div")
    preview.setAttribute("class", "preview")

    const previewImage = document.createElement("img")
    previewImage.setAttribute("src", blob)
    previewImage.setAttribute("alt", "User Icon")
    previewImage.setAttribute("class", "user_icon")

    preview.appendChild(previewImage)
    previews.appendChild(preview)
  })
}

window.addEventListener("turbo:load", preview)
window.addEventListener("turbo:render", preview)