# git vs GitHub

### Git is a version control system and using this we can save our code and version control it.

### git a  local version control system 

### GitHub is a remote central version control system.

### Common Git commands:

```
$ git clone repoURL.git                         ; clones or download the repository from GitHUb
$ git add fileName  or   git add .              ; git will start tracking all the changes that you made 
$ git commit -m "Brief message of your changes" ; commit means, you're telling git to COMMIT/SAVE it ; you can only push the changes that are commited.
$ git push                                      ; pushes the changes that you've made to gitHub 
$ git pull                                      ; be in the folder repository, this will pull all the changes
```

### How to authenticate from your local to GitHub ?

```
1) Github authentication works based on PAT. ( Personal Acccess Token )
2) your profile on github ---> settings ---> Developer Settings  ----> Generate Classic PAT 
3) When you do a git push, git prompts you to enter the PAT and that's it bingo. You're authenticated.

PS : PAT is sensitive and is not supposed to be shared with anyone.

```