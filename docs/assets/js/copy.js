document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("pre > code").forEach(block => {
    // Create button
    const button = document.createElement("button");
    button.className = "copy-btn";
    button.textContent = "Copy";

    // Copy logic
    button.addEventListener("click", () => {
      navigator.clipboard.writeText(block.textContent).then(() => {
        button.textContent = "Copied!";
        setTimeout(() => (button.textContent = "Copy"), 2000);
      });
    });

    // Positioning
    const pre = block.parentNode;
    pre.style.position = "relative";
    pre.appendChild(button);
  });
});
