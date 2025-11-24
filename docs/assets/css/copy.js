document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("pre > code").forEach((codeBlock) => {
    const btn = document.createElement("button");
    btn.className = "copy-button";
    btn.type = "button";
    btn.textContent = "Copy";

    btn.onclick = () => {
      // Get raw code text
      let rawText = codeBlock.innerText;

      // Remove leading "$ " from each line (if present)
      let sanitized = rawText
        .split("\n")
        .map(line => line.replace(/^\$\s*/, "")) // remove shell prompt
        .join("\n");

      // Add a safety comment at the top
      let finalText = "# Review before executing\n" + sanitized;

      // Remove the trailing newline so the terminal doesn't auto-execute
      finalText = finalText.replace(/\n$/, "");

      navigator.clipboard.writeText(finalText).then(() => {
        btn.textContent = "Copied!";
        setTimeout(() => (btn.textContent = "Copy"), 2000);
      });
    };

    codeBlock.parentNode.appendChild(btn);
  });
});
