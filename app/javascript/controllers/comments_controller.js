import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {}
  connect() {
    console.log("Stimulus connected");
  }
  toggleForm(event) {
    // debugger

    console.log("clicked on comment edit");
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const form = document.getElementById(formID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("d-none");
    console.log("exit comment controller");
  }
}
