--------------------
GIT Commands
--------------------
    Documentation: https://git-scm.com/doc/git

    git config –global user.name “Your Name”
    git config –global user.email “youremail@domain.com”
    git clone https://github.com/username/repo.git

    cd repo
    git status
    git add .
    git commit -m “Initial commit”
    git push -u origin master
    git pull
    git push
    git branch

    ## Differnce between existing file text and stagging file text
    git diff

    ## Differnce between existing file text and latest commit text
    git diff HEAD

    git restore <file_name>
    git restore --staged <file_name>

    git commit --amend
    git push --force
    
    git rm <file>