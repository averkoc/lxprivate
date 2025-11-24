# Github-pages features used in this site  
It is possible to just write markdown pages and refer to them with averkoc.github.io/lx/pagename. After edits the github pages automatically (with Jekyll) converts the pages to html. To do some fine tuning I added the standard Jekyll folders and edited files:
* [docs/_layouts/default.html](_layouts/default.html)
* [docs/assets/css/style.css](assets/css/style.css)
* [docs/_config.yml](_config.yml)

In addition to those I added [docs/assets/css/copy.js](assets/css/copy.js) that adds copy functionality to code blocks.  

## Tips  
Do to the added files you need to add the following block into the beginning of each md page. Otherwise the page's first heading is taken as a title to the page and it is presented twice.

```markdown
---
title: ""
layout: default
---
````

## Github actions  
* hash.yml - uses [hashes.md](hashes.md) as input and creates hash.html that students can use to check downloaded image files. The hash.html is not automatically inserted to /docs you need to download it from action page and upload to /docs  
* offlinetoc.yml - creates offline table of contents with correct hyperlinks and hover on feature that shows the beginning of the linked file contents
  


