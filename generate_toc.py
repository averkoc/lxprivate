import os

# Folder to scan
ROOT = "docs"   # change this if needed
OUTPUT = "TOC.md"

EXTENSIONS = (".md", ".html")


def generate_toc():
    lines = ["# Table of Contents\n"]

    for current_dir, dirs, files in os.walk(ROOT):
        # Sort for stable output
        dirs.sort()
        files.sort()

        # Depth for indentation
        depth = current_dir.count(os.sep) - ROOT.count(os.sep)

        # Skip the root folder heading
        if depth >= 0:
            # Add folder section heading (skip root if you don't want it)
            folder_name = os.path.basename(current_dir) or ROOT
            if depth == 0:
                lines.append(f"\n## {folder_name}\n")
            else:
                indent = "  " * (depth - 1)
                lines.append(f"{indent}- **{folder_name}/**")

        # Add files inside this folder
        for f in files:
            if not f.endswith(EXTENSIONS):
                continue

            filepath = os.path.join(current_dir, f).replace("\\", "/")
            link = filepath.replace(" ", "%20")

            indent = "  " * depth
            lines.append(f"{indent}- [{f}]({link})")

    return "\n".join(lines)


if __name__ == "__main__":
    toc = generate_toc()
    with open(OUTPUT, "w", encoding="utf-8") as f:
        f.write(toc)
    print(f"TOC generated in {OUTPUT}")
