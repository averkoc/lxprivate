
````yaml
# This is check definitions for "ws3 shared directories for project groups "sudo .\check account" uses this
# with hardcoded name expected_projects.yaml  
projects:
  teampubfiles:
    group: "teampub"
    files:
      - name: "1file"
        ownerSuffix: "1"
        group: "teampub"
        permissions: "0664"
  teamsecfiles:
    group: "teamsec"
    files:
      - name: "4file"
        ownerSuffix: "4"
        group: "teamsec"
        permissions: "0664"
````


```yaml
# Example how requirement that file contains strings could be presented  
projects:
  teampubfiles:
    group: "teampub"
    files:
      - name: "1file"
        ownerSuffix: "1"
        group: "teampub"
        permissions: "0664"
        contains:
          - "Successfully completed"
          - "User login"
```` 
