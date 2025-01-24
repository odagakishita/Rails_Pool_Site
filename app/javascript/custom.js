document.addEventListener("turbo:load", () => {
  const addRoutineStepButton = document.querySelector("#add-routine-step");
  const routineStepsContainer = document.querySelector("#routine-steps-container");

  if (addRoutineStepButton) {
    addRoutineStepButton.addEventListener("click", () => {
      const newStep = document.createElement("div");
      newStep.classList.add("routine-step");
      newStep.innerHTML = `
        <input type="text" name="post[routine_steps][]" placeholder="手順を入力してください" class="form-input routine-step-field">
      `;
      routineStepsContainer.appendChild(newStep);
    });
  }
});
