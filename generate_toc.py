import os

# Folder to scan
ROOT = "docs"
OUTPUT = os.path.join(ROOT, "toc.md")  # Write directly to docs/toc.md
EXTENSIONS = (".md", ".html")

def generate_toc():
    lines = [
        "---",
        "title: Table of Contents",
        "layout: default",
        "---",
        "",
        "# Table of Contents",
        ""
    ]
    
    for current_dir, dirs, files in os.walk(ROOT):
        # Sort for stable output
        dirs.sort()
        files.sort()
        
        # Calculate depth relative to ROOT
        depth = current_dir.count(os.sep) - ROOT.count(os.sep)
        
        # Skip the root folder heading
        if depth >= 0:
            folder_name = os.path.basename(current_dir) or ROOT
            if depth == 0:
                lines.append(f"## {folder_name}")
                lines.append("")
            else:
                indent = "  " * (depth - 1)
                lines.append(f"{indent}- **{folder_name}/**")
        
        # Add files inside this folder
        for f in files:
            if not f.endswith(EXTENSIONS):
                continue
            
            # Skip the toc file itself to avoid self-reference
            if f == "toc.md":
                continue
            
            # Build relative path from ROOT
            filepath = os.path.join(current_dir, f).replace("\\", "/")
            
            # Remove ROOT prefix to make path relative
            if filepath.startswith(ROOT + "/"):
                link = filepath[len(ROOT) + 1:]  # Remove "docs/"
            else:
                link = filepath
            
            # URL encode spaces
            link = link.replace(" ", "%20")
            
            # For Jekyll: remove file extensions and use clean URLs
            # Jekyll typically converts page.md to /page/ or /page.html
            if link.endswith(".md"):
                link = link[:-3]  # Remove .md extension
            elif link.endswith(".html"):
                link = link[:-5]  # Remove .html extension
            
            # Add leading slash for absolute path from site root
            link = "/" + link
            
            indent = "  " * depth
            lines.append(f"{indent}- [{f}]({link})")
    
    return "\n".join(lines)

if __name__ == "__main__":
    toc = generate_toc()
    with open(OUTPUT, "w", encoding="utf-8") as f:
        f.write(toc)
    print(f"toc generated in {OUTPUT}")
    print(f"Generated {len(toc)} characters")
    print("First 100 chars:", toc[:100])
