import re, sys

template = """<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hash Comparisons</title>
<style>
.hash-input { font-size: 1.5rem; width: 70%; text-transform: lowercase; padding: 5px; }
label { font-size: 1.5rem; text-transform: lowercase; }
button { background-color: orange; border: none; color: white; padding: 15px 32px; font-size: 16px; }
#result { font-size: 1.5rem; }
.instructions { font-size: 1.3rem; max-width: 800px; }
.instructions code { background: #eee; padding: 4px; }
.collapsible {
  background-color: #f1f1f1;
  color: black;
  cursor: pointer;
  padding: 10px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 1.2rem;
}
.active, .collapsible:hover { background-color: #ccc; }
.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f9f9f9;
}
</style>
<script>
function compareHashes() {
  const hash1 = document.getElementById("hash1").value.toLowerCase();
  const hash2 = document.getElementById("hash2").value.toLowerCase();
  const input1 = document.getElementById("hash1");
  const input2 = document.getElementById("hash2");
  const result = document.getElementById("result");
  const check = document.getElementById("check");

  if (!hash1 || !hash2) {
    result.innerHTML = "Please enter both hashes to compare.";
    input1.style.backgroundColor = "";
    input2.style.backgroundColor = "";
    check.innerHTML = "Click to compare Hashes";
    check.style.background = "orange";
    return;
  }

  if (hash1 === hash2) {
    check.innerHTML = "Hashes match!";
    check.style.background = "green";
    input1.style.backgroundColor = "#c8f7c5"; // light green
    input2.style.backgroundColor = "#c8f7c5";
    result.innerHTML = "";
  } else {
    check.innerHTML = "Hashes don't match!";
    check.style.background = "red";
    input1.style.backgroundColor = "#f7c5c5"; // light red
    input2.style.backgroundColor = "#f7c5c5";
    result.innerHTML = "";
  }
}

function selectHash(hash) { 
  document.getElementById("hash1").value = hash; 
  compareHashes(); // update highlight automatically
}

document.addEventListener("DOMContentLoaded", function() {
  var coll = document.getElementsByClassName("collapsible");
  for (var i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      content.style.display = (content.style.display === "block") ? "none" : "block";
    });
  }

  // optional: highlight dynamically as user types
  const hash1Input = document.getElementById("hash1");
  const hash2Input = document.getElementById("hash2");
  hash1Input.addEventListener("input", compareHashes);
  hash2Input.addEventListener("input", compareHashes);
});
</script>
</head>
<body>
<h1>Hash Comparisons</h1>
<p>Pick the reference SHA-256 value to "reference" by clicking a filename below and paste your calculated hash to "your hash":</p>
<nav>
<ul>
{links}
</ul>
</nav>
<section>
<label for="hash1">Reference:</label>
<input type="text" class="hash-input" id="hash1" />
<br><br>
<label for="hash2">Your hash:</label>
<input type="text" class="hash-input" id="hash2" />
<br><br>
<button id="check" onclick="compareHashes()">Click to compare Hashes</button>
<p id="result"></p>
</section>

<hr>

<h2>How to Calculate a SHA-256 Hash</h2>

<button class="collapsible">Windows (CMD)</button>
<div class="content instructions">
<p>Open Command Prompt and run:</p>
<p><code>certutil -hashfile filename.ext SHA256</code></p>
</div>

<button class="collapsible">Windows (PowerShell)</button>
<div class="content instructions">
<p>Open PowerShell and run:</p>
<p><code>Get-FileHash filename.ext -Algorithm SHA256</code></p>
</div>

<button class="collapsible">macOS</button>
<div class="content instructions">
<p>Open Terminal and run:</p>
<p><code>shasum -a 256 filename.ext</code></p>
</div>

</body>
</html>
"""

def parse_md(md_text):
    pattern = r"- (.+?)\s+`([0-9a-f]{64})`"
    return re.findall(pattern, md_text)

def make_links(pairs):
    return "\n".join(
        f'<li><a href="#" onclick="selectHash(\'{h}\')">{f}</a></li>'
        for f,h in pairs
    )

if __name__ == "__main__":
    md_file = sys.argv[1]
    html_file = sys.argv[2]
    with open(md_file) as f: md_text = f.read()
    pairs = parse_md(md_text)
    links = make_links(pairs)
    html = template.replace("{links}", links)
    with open(html_file, "w") as f: f.write(html)
