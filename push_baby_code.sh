#!/bin/bash
set -x
function rand() {
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s)
    echo $(($num%$max+$min))
}

defaultCommit=(
"Random: here's no commit desc, because the author was so lazy"
"Random: hi"
"Random: Honda!!!"
"Random: dream car: PorscheGt3RS"
"Random: what time?"
"Random: two monkey on the tree~~~ coding bugs every day~~ so happy so happy~~"
)
defaultCommitLen=${#defaultCommit[@]}
((defaultCommitLen=$defaultCommitLen-1))

# Input
commitVal=${1:-""}

if [[ -z "${commitVal}" || "${commitVal}" == "" ]]; then
    randIndex=`rand 0 ${defaultCommitLen}`
    commitVal=${defaultCommit[$randIndex]} # `date +"%Y/%m/%d %H:%M:%S"`
fi

git status
git add -A
git commit -m "$commitVal"
git push origin master
#git push
