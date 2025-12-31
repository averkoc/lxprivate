
## Examples  

## 🚀 Batch Updating Image Paths with `sed`

When migrating my Linux-hosted site, I found that many image links broke because the directory structure had changed. Here is how I solved it using a single terminal command.

---

### 🔍 The Scenario
To ensure the pages worked across different environments, I needed to change the image source paths from a local directory to a parent directory reference.

| Original Path | Target Path |
| :--- | :--- |
| `src="images/..."` | `src="../images/..."` |

**Example Transformation:**
* **From:** `<img width="614" height="360" alt="image" src="images/photo.png" />`
* **To:** `<img width="614" height="360" alt="image" src="../images/photo.png" />`

---

### 💡 The Solution
Updating these manually would have been tedious. Instead, I used `sed` (Stream Editor) to perform a global search and replace across all Markdown files instantly.

```bash
sed -i 's|src="images/|src="../images/|g' *.md
