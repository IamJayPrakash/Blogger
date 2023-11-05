import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Stimulus is working i think");
  }
    likeme(event, postId) {
      // alert("you are connected");
      event.preventDefault();
      // console.log("hey u have clicked the  button");

      $.ajax({
        url: "/posts/" + postId + "/like",
        type: "put",
        success: function (response) {
          // update likes count
          document.getElementById("likes-count").textContent =
            response.likes_count;
        },
        error: function (error) {
          console.log(error);
        },
      });
    }
  }
