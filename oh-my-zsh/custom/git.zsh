alias nah="git reset --hard; git clean -df"
alias prune="git remote prune origin"
alias wip="git add . && git commit -m 'WIP'"
alias stage-it="git co staging && git merge master && git push origin staging && git co master"
alias release-it="git co release && git merge staging && git push origin release && git co master"
alias stage-and-release-it="git co staging && git merge master && git push origin staging && git co release && git merge staging && git push origin release && git co master"
