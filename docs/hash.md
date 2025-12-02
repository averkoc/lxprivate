---
layout: default
title: ""
---

## Hash Comparisons

Pick the **Reference** SHA-256 value by clicking a filename below and paste your calculated hash to **Your hash**. 

<ul style="line-height: 1.6;">
{% for item in site.data.hashes %}
  <li>
    <a href="#" onclick="selectHash('{{ item.sha }}'); return false;">
      {{ item.file }}
    </a>
  </li>
{% endfor %}
</ul>

---

### Reference
<input id="hash1" class="hash-input" />

### Your hash
<input id="hash2" class="hash-input" />

<button id="check" onclick="compareHashes()">Click to compare Hashes</button>

<p id="result"></p>

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
    input1.style.backgroundColor = "#c8f7c5";
    input2.style.backgroundColor = "#c8f7c5";
    result.innerHTML = "";
  } else {
    check.innerHTML = "Hashes don't match!";
    check.style.background = "red";
    input1.style.backgroundColor = "#f7c5c5";
    input2.style.backgroundColor = "#f7c5c5";
    result.innerHTML = "";
  }
}

function selectHash(hash) {
  document.getElementById("hash1").value = hash;
  compareHashes();
}

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("hash1").addEventListener("input", compareHashes);
  document.getElementById("hash2").addEventListener("input", compareHashes);
});
</script>

<style>
.hash-input { font-size: 1.2rem; width: 70%; padding: 5px; text-transform: lowercase; }
button { padding: 10px 20px; font-size: 1rem; color: white; background-color: orange; border: none; }
#check { cursor: pointer; }
#result { font-size: 1.2rem; margin-top: 10px; }
</style>

----

### How to calculate SHA-256 Hash

**Windows (CMD):**  
```cmd
certutil -hashfile filename.ext SHA256
````
**Powershell**  
```cmd
Get-FileHash filename.ext -Algorithm SHA256
````

**maOS / Linux**  
```bash
shasum -a 256 filename.ext
````






