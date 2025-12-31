
## Examples  
In my Linux web-site I needed to change picture links in pages to make the pages work also when moved to another site.  
Originally: 
`<img width="614" height="360" alt="image" src="images/a24812307964.png" />`   
Needed to be:
`<img width="614" height="360" alt="image" src="../images/a24812307964.png" />`

That would have been a tedious task to do manually but remebering `sed` it was one-line task:  
 `sed -i 'sed -i 's|src="images/|src="../images/|g' *.md`
