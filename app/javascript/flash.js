function flash() {
  var flashMessage = document.getElementById('flash-message');
  if (flashMessage && flashMessage.innerHTML.trim() !== '') {
    flashMessage.classList.add('show'); // 表示

    // 5秒後にメッセージを消す
    setTimeout(function() {
      flashMessage.classList.add('hide'); // フェードアウト
    }, 5000);
  }
}

window.addEventListener("turbo:load", flash)
window.addEventListener("turbo:render", flash)