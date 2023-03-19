#####################
# Begin Code Stuffs #
#####################

# Homebrew
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

# Go CLI stuff
alias cobra='$HOME/go/bin/cobra'
export PATH="$HOME/go/bin/cobra:$PATH"
alias go-vote=$HOME/go/bin/go-vote
alias checkin=$HOME/go/bin/checkin

PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin
[ -f "/Users/badmin/.ghcup/env" ] && source "/Users/badmin/.ghcup/env" # ghcup-env

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2021-11-17 22:10:41
export PATH="$PATH:/Users/badmin/.local/bin"

# Docker
export DOCKER_BUILDKIT=0

# Gcloud shell completions
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

######################
# Begin Productivity #
######################

# In the current repo, display all the associated github issues, with a preview of the comments. If selected, open the issue in the browser
function search_github_issues() {
	gh issue list -s $1 -L 300 --json state,number,title,assignees,labels --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .state .title (join "," (pluck "login" .assignees)) (join "," (pluck "name" .labels))}}{{end}}' | fzf --preview-window wrap --preview "gh issue view --json title,author,state,number,body,comments,projectCards,assignees --template '#{{.number}} {{.title}}{{\"\n\"}}State:{{(.state)}}{{\"\n\"}}Project:{{pluck \"name\" (pluck \"column\" .projectCards)}}{{\"\n\"}}Author:{{.author.login}}{{\"\n\"}}Assigness:{{join \",\" (pluck \"login\" .assignees)}}{{\"\n\"}}{{.body}}{{\"\n\"}}{{range .comments}}Commentor:{{.author.login}} {{.createdAt}} {{\"\n\"}}{{.body}}{{\"\n\n\"}}{{end}}' {+1}" | awk '{print $1}' | xargs gh issue view --web
}
alias ghif="search_github_issues open"
alias ghifc="search_github_issues all"

# Create a PR, using the current branch pointed to its parent.
function create_pr_from_latest() {
	ROOT=$(git rev-parse --show-toplevel)
	TITLE=$(git log -1 --pretty=%B)
	PARENT=$(git log --pretty=format:'%D' HEAD^ | grep 'origin/' | head -n1 | sed 's@origin/@@' | sed 's@,.*@@')

	gh pr create -B $PARENT -F $ROOT/.github/pull_request_template.md -t $TITLE -w
}
alias ghrc="create_pr_from_latest"

# Take the contents of the clipboard and render them in a fzf preview window
function interactive_jq() {
	echo '' | fzf --print-query --preview '(pbpaste) | jq {q}'
}
alias jqf="interactive_jq"
