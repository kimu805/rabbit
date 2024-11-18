import consumer from "channels/consumer"

if (location.pathname.match(/\/projects\/\d/)) {

  consumer.subscriptions.create({
    channel: "CommentChannel",
    project_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      const html = `
        <div class= "projectShow_comment">
          <div class= "projectShow_comment_header_box">
            <div class= "projectShow_comment_user">${ data.user.nickname }</div>
            <div class= "projectShow_comment_createdAt">${ data.created_at }</div>
          </div>
          <div class= "projectShow_comment_text">${ data.comment.text }</div>
          <div class= "projectShow_comment_management_box">
            <div class= "projectShow_comment_deleteBtn">削除</div>
          </div>
        </div>
      `
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML("beforeend", html)
      const commentForm = document.getElementById("comment_form")
      commentForm.reset()
    }
  });
}